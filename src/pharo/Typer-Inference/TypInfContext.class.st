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
		'iterationsMax'
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
	iterationsMax := 64
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
	root node method isAbstract ifTrue: [ ^ self	"shortcut loop" ].
	[ iterationsDone := iterationsDone + 1.
	iterationsDone <= iterationsMax
		and: [  "nodes are changed by inlining methods, hence cannot be cached"nodes values
				inject: false
				into: [ :rr :c | c inject: rr into: [ :r :e | e slurpAndBurp or: r ] ] ] ]
		whileTrue
]

{ #category : #running }
TypInfContext >> runDebug [
	| n states cycles cycle stable |
	self visit.
	n := 32.
	states := IdentityDictionary new.
	cycles := OrderedCollection new.
	cycle := OrderedIdentityDictionary new.
	nodes values
		do: [ :c | c do: [ :e | cycle at: e put: (states at: e put: e state copy) ] ].
	root node method isAbstract ifTrue: [ n := 0	"shortcut loop" ].
	[ n := n - 1.
	cycles add: cycle.
	cycle := OrderedIdentityDictionary new.
	n > 0
		and: [  "nodes are changed by inlining methods, hence cannot be cached"nodes values
				inject: false
				into: [ :rr :c | 
					c
						inject: rr
						into: [ :r :e | 
							e slurpAndBurp.
							e state = (states at: e ifAbsentPut: [ e state copy ])
								ifTrue: [ r ]
								ifFalse: [ cycle at: e put: ((states at: e ifAbsentPut: [ e state copy ]) diff: e state).
									states at: e put: e state copy.
									true ] ] ] ] ] whileTrue.
	cycles add: cycle.
	stable := n > 0.
	^ cycles
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
	current inArguments: (aMethodNode arguments collect: [ :n | self nodesAddAt: n ]).
	self visitNode: aMethodNode body.
	aMethodNode lastIsReturn
		ifFalse: [ self next: RBVariableNode selfNode.
			current outAdd: (TypInfReturnEdge origin: current target: root) ].
	^ root
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
		inArguments: (aSequenceNode temporaries collect: [ :n | self nodesAddAt: n ]).
	aSequenceNode statements do: [ :n | self visitNode: n ]
]

{ #category : #visiting }
TypInfContext >> visitVariableNode: aVariableNode [

	^ self next: aVariableNode
]
