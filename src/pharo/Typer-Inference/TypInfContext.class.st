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
		inlitializeSender: aContext
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
TypInfContext >> inlitializeSender: aContext state: aState node: aNode self: aType super: anotherType [
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
TypInfContext >> iterate [
	^ nodes values
		inject: false
		into: [ :rr :c | c inject: rr into: [ :r :e | (self iterate: e) or: r ] ]
]

{ #category : #accessing }
TypInfContext >> iterate: aNode [
	"skip removed nodes"

	nodes
		at: aNode node
		ifPresent: [ :c | (c includes: aNode) ifFalse: [ ^ false ] ]
		ifAbsent: [ ^ false ].
	aNode canSlurpAndBurp ifFalse: [ ^ false ].
	^ aNode slurpAndBurp
]

{ #category : #accessing }
TypInfContext >> next: aNode [
	| next |
	self flag: 'Q is it always add? look at senders'.
	next := self nodesAddAt: aNode.
	current outAdd: (TypInfNextEdge origin: current target: next).
	^ current := next
]

{ #category : #accessing }
TypInfContext >> node [
	^ node
]

{ #category : #accessing }
TypInfContext >> nodeAt: aNode [
	^ nodes
		at: aNode
		ifAbsent: [ Halt now.
			self nodesAddAt: aNode ]
]

{ #category : #accessing }
TypInfContext >> nodes [
	^ nodes
]

{ #category : #accessing }
TypInfContext >> nodesAddAt: aNode [
	| newNode |
	newNode := aNode typInfNodeInContext: self.
	^ nodes
		at: aNode
		ifPresent: [ :c | c add: newNode ]
		ifAbsent: [ (nodes at: aNode put: (OrderedCollection with: newNode)) last ]
]

{ #category : #accessing }
TypInfContext >> nodesAt: aNode [
	^ nodes
		at: aNode
		ifAbsent: [ sender ifNil: [ #() ] ifNotNil: [ sender nodesAt: aNode ] ]
]

{ #category : #accessing }
TypInfContext >> nodesAt: aNode add: anotherNode [
	nodes
		at: aNode
		ifPresent: [ :c | c add: anotherNode ]
		ifAbsentPut: [ OrderedCollection with: anotherNode ].
	^ anotherNode
]

{ #category : #accessing }
TypInfContext >> nodesAt: aNode remove: anotherNode [
	nodes
		at: aNode
		ifPresent: [ :c | 
			c remove: anotherNode.
			c ifEmpty: [ nodes removeKey: aNode ] ]
		ifAbsent: [  "noop" ].
	^ anotherNode
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
	iterationsDone <= iterationsMax and: [ self iterate ] ] whileTrue
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
	root := self nodesAt: node add: (node typInfNodeInContext: self).
	current := root.
	node acceptVisitor: self.
	nodes keysAndValuesDo: [ :n :c | c do: [ :e | e initialize: state ] ]
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
	aLocalNode isDefinition
		ifFalse: [ self flag: 'Q is last always correct?'.
			current inRead: (self nodesAt: aLocalNode variable definingNode) last ].
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
	self flag: 'Q is last always correct?'.
	current inReceiver: (self nodesAt: aMessageNode receiver) last.
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
TypInfContext >> visitPragmaNode: aPragmaNode [
	| variable |
	aPragmaNode arguments do: [ :each | self visitNode: each ].
	aPragmaNode isPrimitiveError ifFalse: [ ^ self ].
	variable := (node scope lookupVar: aPragmaNode primitiveErrorVariableName)
			definingNode.
	self nodesAddAt: variable.
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
