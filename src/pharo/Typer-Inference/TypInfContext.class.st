Class {
	#name : #TypInfContext,
	#superclass : #TypNode,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#instVars : [
		'root',
		'current',
		'nodes',
		'state',
		'stable'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfContext class >> node: aMethodNode self: aType super: anotherType [

	^ self new
		  initializeNode: aMethodNode self: aType super: anotherType;
		  yourself
]

{ #category : #initialization }
TypInfContext >> initializeNode: aMethodNode self: aType super: anotherType [

	"ordered to have a cheap, close-to-topological sorting.
	 makes the run more predictable"

	stable := nil.
	root := nil.
	current := nil.
	nodes := OrderedIdentityDictionary new.
	aMethodNode acceptVisitor: self.
	state := TypInfState self: aType super: anotherType.
	nodes valuesDo: [ :e | e initialize: state ].
	nodes keysAndValuesDo: [ :n :e | 
		self outgoingAt: n put: e.
		e outgoing
			at: #next
			ifPresent: [ :s | s do: [ :f | f state: state copy ] ] ]
]

{ #category : #accessing }
TypInfContext >> next: aNode [

	| node |
	node := self nodeAt: aNode.
	current outgoingAdd: (TypInfNextEdge origin: current target: node).
	^ current := node
]

{ #category : #accessing }
TypInfContext >> nodeAt: aNode [

	^ nodes at: aNode ifAbsentPut: [ aNode typInfNode ]
]

{ #category : #accessing }
TypInfContext >> nodes [

	^ nodes
]

{ #category : #accessing }
TypInfContext >> root [

	^ root
]

{ #category : #running }
TypInfContext >> run [

	| n nodes_ states cycles cycle |
	n := 100.
	nodes_ := nodes values.
	states := IdentityDictionary new.
	cycles := OrderedCollection new.
	cycle := OrderedIdentityDictionary new.
	nodes_ do: [ :e | cycle at: e put: (states at: e put: e state copy) ].
	root node method isAbstract ifTrue: [ n := 0 "shortcut loop" ].
	[ 
	n := n - 1.
	cycles add: cycle.
	cycle := OrderedIdentityDictionary new.
	n > 0 and: [ 
		nodes_ inject: false into: [ :r :e | 
			e slurpAndBurp.
			e state = (states at: e)
				ifTrue: [ r ]
				ifFalse: [ 
					cycle at: e put: ((states at: e) diff: e state).
					states at: e put: e state copy.
					true ] ] ] ] whileTrue.
	cycles add: cycle.
	stable := n > 0.
	^ cycles
]

{ #category : #visiting }
TypInfContext >> visitArrayNode: anArrayNode [

	| arguments |
	arguments := anArrayNode statements collect: [ :n | 
		             self visitNode: n ].
	self next: anArrayNode.
	current incomingArguments: arguments.
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

	| block |
	block := self next: aBlockNode.
	current incomingArguments:
		(aBlockNode arguments collect: [ :n | self nodeAt: n ]).
	self visitNode: aBlockNode body.
	current outgoingAdd: (TypInfReturnEdge
			 origin: current
			 target: block
			 type: BlockClosure typAsType).
	^ current := block
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
	current incomingArguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfContext >> visitLiteralValueNode: aNode [

	^ self next: aNode
]

{ #category : #visiting }
TypInfContext >> visitLocalVariableNode: aLocalNode [

	self visitTemporaryNode: aLocalNode.
	aLocalNode isDefinition ifFalse: [ 
		current incomingRead:
			(self nodeAt: aLocalNode variable definingNode) ].
	^ current
]

{ #category : #visiting }
TypInfContext >> visitMessageNode: aMessageNode [

	| arguments |
	(aMessageNode isCascaded not or: [ aMessageNode isFirstCascaded ]) 
		ifTrue: [ self visitNode: aMessageNode receiver ].
	arguments := aMessageNode arguments collect: [ :n | 
		             self visitNode: n ].
	self next: aMessageNode.
	current incomingArguments: arguments.
	current incomingReceiver: (self nodeAt: aMessageNode receiver).
	^ current
]

{ #category : #visiting }
TypInfContext >> visitMethodNode: aMethodNode [

	self assert: [ root isNil ].
	self assert: [ current isNil ].
	root := self nodeAt: aMethodNode.
	current := root.
	current incomingArguments:
		(aMethodNode arguments collect: [ :n | self nodeAt: n ]).
	self visitNode: aMethodNode body.
	aMethodNode lastIsReturn ifFalse: [ 
		self next: RBVariableNode selfNode.
		current outgoingAdd: (TypInfReturnEdge
				 origin: current
				 target: root
				 type: CompiledMethod typAsType) ].
	^ root
]

{ #category : #visiting }
TypInfContext >> visitReturnNode: aReturnNode [

	self visitNode: aReturnNode value.
	self next: aReturnNode.
	current outgoingAdd: (TypInfReturnEdge
			 origin: current
			 target: root
			 type: CompiledMethod typAsType).
	^ current := root
]

{ #category : #visiting }
TypInfContext >> visitSequenceNode: aSequenceNode [

	self next: aSequenceNode.
	current incomingArguments:
		(aSequenceNode temporaries collect: [ :n | self nodeAt: n ]).
	aSequenceNode statements do: [ :n | self visitNode: n ]
]

{ #category : #visiting }
TypInfContext >> visitVariableNode: aVariableNode [

	^ self next: aVariableNode
]
