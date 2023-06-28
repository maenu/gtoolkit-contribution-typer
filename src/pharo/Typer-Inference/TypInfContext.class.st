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
		'nodes'
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

{ #category : #'as yet unclassified' }
TypInfContext >> inlitializeSender: aContext state: aState node: aNode self: aType super: anotherType [
	sender := aContext.
	state := aState.
	node := aNode.
	selfType := aType.
	superType := anotherType.
	nodes := OrderedIdentityDictionary new	"ordered to have a cheap, close-to-topological sorting.
	 makes the run more predictable"
]

{ #category : #accessing }
TypInfContext >> next: aNode [
	| next |
	next := self nodeAt: aNode.
	current outgoingAdd: (TypInfNextEdge origin: current target: next).
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
		ifAbsentPut: [ (aNode typInfNodeInContext: self)
				methodNode: root;
				yourself ]
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
	| n nodes_ states cycle cycles stable |
	self visit.
	n := 100.
	nodes_ := nodes values.
	states := IdentityDictionary new.
	cycles := OrderedCollection new.
	cycle := OrderedIdentityDictionary new.
	nodes_ do: [ :e | cycle at: e put: (states at: e put: e state copy) ].
	root node method isAbstract ifTrue: [ n := 0	"shortcut loop" ].
	[ n := n - 1.
	cycles add: cycle.
	cycle := OrderedIdentityDictionary new.
	n > 0
		and: [  "nodes are changed by inlining methods, hence cannot be cached"nodes values
				inject: false
				into: [ :r :e | 
					e slurpAndBurp.
					e state = (states at: e ifAbsentPut: [ e state copy ])
						ifTrue: [ r ]
						ifFalse: [ cycle at: e put: ((states at: e ifAbsentPut: [ e state copy ]) diff: e state).
							states at: e put: e state copy.
							true ] ] ] ] whileTrue.
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
	root := nodes at: node put: (node typInfNodeInContext: self).
	current := root.
	node acceptVisitor: self.
	nodes
		keysAndValuesDo: [ :n :e | 
			e initialize: state.
			e outgoing at: #next ifPresent: [ :s | s do: [ :f | f state: state copy ] ] ]
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
	current
		outgoingAdd: (TypInfReturnEdge
				origin: current
				target: root
				type: CompiledMethod typAsType)
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
