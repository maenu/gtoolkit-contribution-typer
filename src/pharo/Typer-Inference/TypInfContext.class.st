Class {
	#name : #TypInfContext,
	#superclass : #TypNode,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#instVars : [
		'sender',
		'node',
		'selfType',
		'superType',
		'state',
		'root',
		'current',
		'nodes',
		'iterationsDone',
		'iterationsMax',
		'iterations'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfContext class >> sender: aContext state: aState node: aNode self: aType super: anotherType [
	^ self new
		initializeSender: aContext
			state: aState
			node: aNode
			self: aType
			super: anotherType;
		yourself
]

{ #category : #accessing }
TypInfContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	sender == anObject sender ifFalse: [ ^ false ].
	node == anObject node ifFalse: [ ^ false ].
	selfType = anObject self ifFalse: [ ^ false ].
	superType = anObject super ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypInfContext >> diffIterate [
	self assert: [ iterations size = (iterationsDone - 1) ].
	iterations addLast: IdentityDictionary new.
	^ nodes values
		inject: false
		into: [ :rr :c | c inject: rr into: [ :r :e | (self diffIterate: e) or: r ] ]
]

{ #category : #accessing }
TypInfContext >> diffIterate: aNode [
	"skip removed nodes"

	nodes
		at: aNode node
		ifPresent: [ :c | (c includes: aNode) ifFalse: [ ^ false ] ]
		ifAbsent: [ ^ false ].
	aNode canSlurpAndBurp ifFalse: [ ^ false ].
	^ aNode diffSlurpAndBurp index
		ifEmpty: [ false ]
		ifNotEmpty: [ :s | 
			(iterations at: iterationsDone) at: aNode put: s.
			true ]
]

{ #category : #running }
TypInfContext >> diffRun [
	self visit.
	[ iterationsDone := iterationsDone + 1.
	iterationsDone <= iterationsMax and: [ self diffIterate ] ] whileTrue
]

{ #category : #accessing }
TypInfContext >> hash [
	^ ({sender.
		node.
		selfType.
		superType} collect: #hash) reduce: [ :r :e | r bitXor: e ]
]

{ #category : #origins }
TypInfContext >> home [
	^ sender ifNil: self ifNotNil: #home
]

{ #category : #accessing }
TypInfContext >> initializeSender: aContext state: aState node: aNode self: aType super: anotherType [
	self assert: [ aType isNotNil ].
	sender := aContext.
	state := aState.
	node := aNode.
	selfType := aType.
	superType := anotherType.
	nodes := OrderedIdentityDictionary new.	"ordered to have a cheap, close-to-topological sorting.
	 makes the run more predictable"
	iterationsDone := 0.
	iterationsMax := 64.
	iterations := OrderedCollection new
]

{ #category : #accessing }
TypInfContext >> newRoot [
	| next |
	next := node typInfNodeInContext: self.
	nodes
		at: node
		ifPresent: [ :c | c add: next ]
		ifAbsentPut: [ OrderedCollection with: next ].
	^ next
]

{ #category : #accessing }
TypInfContext >> next: aNode [
	| next |
	self flag: 'Q is it always add? look at senders'.
	next := aNode typInfNodeInContext: self.
	next := nodes
			at: aNode
			ifPresent: [ :c | c add: next ]
			ifAbsent: [ (nodes at: aNode put: (OrderedCollection with: next)) last ].
	current outAdd: (TypInfNextEdge origin: current target: next).
	^ current := next
]

{ #category : #accessing }
TypInfContext >> node [
	^ node
]

{ #category : #'as yet unclassified' }
TypInfContext >> nodes [
	^ nodes
]

{ #category : #accessing }
TypInfContext >> nodesAt: aNode [
	^ self home root allNextNodes select: [ :n | n node == aNode ]
]

{ #category : #accessing }
TypInfContext >> printOn: aStream [
	node printOn: aStream
]

{ #category : #accessing }
TypInfContext >> root [
	^ root
]

{ #category : #running }
TypInfContext >> run [
	self visit.
	[ iterationsDone := iterationsDone + 1.
	iterationsDone <= iterationsMax and: [ root iterate ] ] whileTrue
]

{ #category : #accessing }
TypInfContext >> self [
	^ selfType
]

{ #category : #accessing }
TypInfContext >> sender [
	^ sender
]

{ #category : #accessing }
TypInfContext >> state [
	^ state
]

{ #category : #accessing }
TypInfContext >> super [
	^ superType
]

{ #category : #accessing }
TypInfContext >> visit [
	current := root := self newRoot.
	self visitNode
]

{ #category : #visiting }
TypInfContext >> visitArrayNode: anArrayNode [

	| arguments |
	arguments := anArrayNode statements collect: [ :n | 
		             self visitNode: n ].
	self next: anArrayNode.
	current inArguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfContext >> visitAssignmentNode: anAssignmentNode [

	self visitNode: anAssignmentNode value.
	self next: anAssignmentNode.
	self visitNode: anAssignmentNode variable.
	^ current
]

{ #category : #visiting }
TypInfContext >> visitBlockNode: aBlockNode [
	^ self next: aBlockNode
]

{ #category : #visiting }
TypInfContext >> visitCascadeNode: aCascadeNode [

	aCascadeNode messages do: [ :e | self visitNode: e ].
	^ self next: aCascadeNode
]

{ #category : #visiting }
TypInfContext >> visitLiteralArrayNode: aLiteralArrayNode [

	| arguments |
	arguments := aLiteralArrayNode contents collect: [ :n | 
		             self visitNode: n ].
	self next: aLiteralArrayNode.
	current inArguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfContext >> visitLiteralValueNode: aNode [

	^ self next: aNode
]

{ #category : #visiting }
TypInfContext >> visitLocalVariableNode: aLocalNode [
	self visitTemporaryNode: aLocalNode.
	aLocalNode isDefinition ifFalse: [ current inRead: current findInRead ].
	^ current
]

{ #category : #visiting }
TypInfContext >> visitMessageNode: aMessageNode [
	| arguments |
	(aMessageNode isCascaded not or: [ aMessageNode isFirstCascaded ])
		ifTrue: [ self visitNode: aMessageNode receiver ].
	arguments := aMessageNode arguments collect: [ :n | self visitNode: n ].
	self next: aMessageNode.
	current inArguments: arguments.
	current inReceiver: current findInReceiver.
	^ current
]

{ #category : #visiting }
TypInfContext >> visitMethodNode: aMethodNode [
	current inArguments: (aMethodNode arguments collect: [ :n | self next: n ]).
	aMethodNode pragmas do: [ :each | self visitNode: each ].
	self visitNode: aMethodNode body.
	aMethodNode lastIsReturn
		ifFalse: [ self next: RBVariableNode selfNode.
			current outAdd: (TypInfReturnEdge origin: current target: root) ].
	^ root
]

{ #category : #accessing }
TypInfContext >> visitNode [
	node acceptVisitor: self
]

{ #category : #accessing }
TypInfContext >> visitPragmaNode: aPragmaNode [
	| variable |
	aPragmaNode arguments do: [ :each | self visitNode: each ].
	aPragmaNode isPrimitiveError ifFalse: [ ^ self ].
	variable := (node scope lookupVar: aPragmaNode primitiveErrorVariableName)
			definingNode.
	self visitNode: variable
]

{ #category : #visiting }
TypInfContext >> visitReturnNode: aReturnNode [
	self visitNode: aReturnNode value.
	self next: aReturnNode.
	current outAdd: (TypInfReturnEdge origin: current target: root)
]

{ #category : #visiting }
TypInfContext >> visitSequenceNode: aSequenceNode [
	self next: aSequenceNode.
	current
		inArguments: (aSequenceNode temporaries collect: [ :n | self next: n ]).
	aSequenceNode statements do: [ :n | self visitNode: n ]
]

{ #category : #visiting }
TypInfContext >> visitVariableNode: aVariableNode [

	^ self next: aVariableNode
]
