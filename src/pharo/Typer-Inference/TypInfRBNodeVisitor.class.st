Class {
	#name : #TypInfRBNodeVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'context',
		'state',
		'root',
		'current',
		'nodes'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfRBNodeVisitor class >> creator: aMessageNode node: aMethodNode self: aType super: anotherType [
	^ self new
		initializeCreator: aMessageNode
			node: aMethodNode
			self: aType
			super: anotherType;
		yourself
]

{ #category : #initialization }
TypInfRBNodeVisitor >> initializeContext: aContext state: aState [
	"ordered to have a cheap, close-to-topological sorting.
	 makes the run more predictable"

	| rbRoot |
	context := aContext.
	state := aState.
	rbRoot := context node node.
	nodes := OrderedIdentityDictionary new.
	root := nodes at: rbRoot put: (rbRoot typInfNodeInContext: self).
	current := root.
	rbRoot acceptVisitor: self.
	nodes
		keysAndValuesDo: [ :n :e | 
			e initialize: state.
			context outgoingAt: n put: e.
			e outgoing at: #next ifPresent: [ :s | s do: [ :f | f state: state copy ] ] ]
]

{ #category : #accessing }
TypInfRBNodeVisitor >> next: aNode [

	| node |
	node := self nodeAt: aNode.
	current outgoingAdd: (TypInfNextEdge origin: current target: node).
	^ current := node
]

{ #category : #accessing }
TypInfRBNodeVisitor >> nodeAt: aNode [

	^ nodes at: aNode ifAbsentPut: [ 
		  (aNode typInfNodeInContext: self)
			  methodNode: root;
			  yourself ]
]

{ #category : #visiting }
TypInfRBNodeVisitor >> visitArrayNode: anArrayNode [

	| arguments |
	arguments := anArrayNode statements collect: [ :n | 
		             self visitNode: n ].
	self next: anArrayNode.
	current incomingArguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfRBNodeVisitor >> visitAssignmentNode: anAssignmentNode [

	self visitNode: anAssignmentNode value.
	self next: anAssignmentNode.
	self visitNode: anAssignmentNode variable.
	^ current
]

{ #category : #visiting }
TypInfRBNodeVisitor >> visitBlockNode: aBlockNode [

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
TypInfRBNodeVisitor >> visitCascadeNode: aCascadeNode [

	aCascadeNode messages do: [ :e | self visitNode: e ].
	^ self next: aCascadeNode
]

{ #category : #visiting }
TypInfRBNodeVisitor >> visitLiteralArrayNode: aLiteralArrayNode [

	| arguments |
	arguments := aLiteralArrayNode contents collect: [ :n | 
		             self visitNode: n ].
	self next: aLiteralArrayNode.
	current incomingArguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfRBNodeVisitor >> visitLiteralValueNode: aNode [

	^ self next: aNode
]

{ #category : #visiting }
TypInfRBNodeVisitor >> visitLocalVariableNode: aLocalNode [

	self visitTemporaryNode: aLocalNode.
	aLocalNode isDefinition ifFalse: [ 
		current incomingRead:
			(self nodeAt: aLocalNode variable definingNode) ].
	^ current
]

{ #category : #visiting }
TypInfRBNodeVisitor >> visitMessageNode: aMessageNode [

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
TypInfRBNodeVisitor >> visitMethodNode: aMethodNode [

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
TypInfRBNodeVisitor >> visitReturnNode: aReturnNode [

	self visitNode: aReturnNode value.
	self next: aReturnNode.
	current outgoingAdd: (TypInfReturnEdge
			 origin: current
			 target: root
			 type: CompiledMethod typAsType).
	^ current := root
]

{ #category : #visiting }
TypInfRBNodeVisitor >> visitSequenceNode: aSequenceNode [

	self next: aSequenceNode.
	current incomingArguments:
		(aSequenceNode temporaries collect: [ :n | self nodeAt: n ]).
	aSequenceNode statements do: [ :n | self visitNode: n ]
]

{ #category : #visiting }
TypInfRBNodeVisitor >> visitVariableNode: aVariableNode [

	^ self next: aVariableNode
]
