Class {
	#name : #TypInfMethodNodeContext,
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
TypInfMethodNodeContext class >> node: aMethodNode self: aType super: anotherType [

	^ self new
		  initializeNode: aMethodNode self: aType super: anotherType;
		  yourself
]

{ #category : #initialization }
TypInfMethodNodeContext >> initializeNode: aMethodNode self: aType super: anotherType [

	| n nodes_ |
	nodes := IdentityDictionary new.
	aMethodNode acceptVisitor: self.
	state := TypInfState self: aType super: anotherType.
	n := 100.
	nodes_ := nodes values.
	nodes_ do: [ :e | e initialize: state ].
	root flowEdgesAll do: [ :e | e state: state copy ].
	[ 
	n := n - 1.
	(nodes_ inject: false into: [ :r :e | e slurpAndBurp or: r ]) and: [ 
		n > 0 ] ] whileTrue.
	nodes_ do: #seal.
	stable := n > 0
]

{ #category : #accessing }
TypInfMethodNodeContext >> next: aNode [

	^ current := current next: (self nodeAt: aNode)
]

{ #category : #accessing }
TypInfMethodNodeContext >> nodeAt: aNode [

	^ nodes at: aNode ifAbsentPut: [ aNode typInfNode ]
]

{ #category : #accessing }
TypInfMethodNodeContext >> nodes [

	^ nodes
]

{ #category : #accessing }
TypInfMethodNodeContext >> root [

	^ root
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitArgumentVariableNode: anArgumentNode [

	self visitLocalVariableNode: anArgumentNode.
	anArgumentNode isDefinition ifFalse: [ 
		current read: (self nodeAt: anArgumentNode variable definingNode) ].
	^ current
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitArrayNode: anArrayNode [

	| arguments |
	arguments := anArrayNode statements collect: [ :n | 
		             self visitNode: n ].
	self next: anArrayNode.
	current arguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitAssignmentNode: anAssignmentNode [

	self visitNode: anAssignmentNode value.
	self next: anAssignmentNode.
	self visitNode: anAssignmentNode variable.
	^ current
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitBlockNode: aBlockNode [

	self next: aBlockNode.
	current arguments:
		(aBlockNode arguments collect: [ :n | self nodeAt: n ]).
	self visitNode: aBlockNode body.
	^ current return: (self nodeAt: aBlockNode)
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitCascadeNode: aCascadeNode [

	^ (aCascadeNode messages collect: [ :e | self visitNode: e ]) last
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitLiteralArrayNode: aLiteralArrayNode [

	| arguments |
	arguments := aLiteralArrayNode contents collect: [ :n | 
		             self visitNode: n ].
	self next: aLiteralArrayNode.
	current arguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitLiteralValueNode: aNode [

	^ self next: aNode
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitMessageNode: aMessageNode [

	| arguments |
	(aMessageNode isCascaded not or: [ aMessageNode isFirstCascaded ]) 
		ifTrue: [ self visitNode: aMessageNode receiver ].
	arguments := aMessageNode arguments collect: [ :n | 
		             self visitNode: n ].
	self next: aMessageNode.
	current arguments: arguments.
	current receiver: (self nodeAt: aMessageNode receiver).
	^ current
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitMethodNode: aMethodNode [

	self assert: [ root isNil ].
	self assert: [ current isNil ].
	root := self nodeAt: aMethodNode.
	current := root.
	current arguments:
		(aMethodNode arguments collect: [ :n | self nodeAt: n ]).
	self visitNode: aMethodNode body.
	aMethodNode lastIsReturn ifFalse: [ 
		self next: RBVariableNode selfNode.
		current return: root ].
	^ root
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitReturnNode: aReturnNode [

	self visitNode: aReturnNode value.
	self next: aReturnNode.
	^ current return: root
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitSequenceNode: aSequenceNode [

	current := current execute: (self nodeAt: aSequenceNode).
	current arguments:
		(aSequenceNode temporaries collect: [ :n | self nodeAt: n ]).
	aSequenceNode statements do: [ :n | self visitNode: n ]
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitTemporaryVariableNode: aTemproraryNode [

	self visitLocalVariableNode: aTemproraryNode.
	aTemproraryNode isDefinition ifFalse: [ 
		current read: (self nodeAt: aTemproraryNode variable definingNode) ].
	^ current
]

{ #category : #visiting }
TypInfMethodNodeContext >> visitVariableNode: aVariableNode [

	^ self next: aVariableNode
]
