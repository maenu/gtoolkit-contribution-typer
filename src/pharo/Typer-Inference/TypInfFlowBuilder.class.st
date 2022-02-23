Class {
	#name : #TypInfFlowBuilder,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'root',
		'current',
		'nodes'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #initialization }
TypInfFlowBuilder >> initialize [

	super initialize.
	nodes := IdentityDictionary new
]

{ #category : #accessing }
TypInfFlowBuilder >> next: aNode [

	current := current next: (self nodeAt: aNode)
]

{ #category : #accessing }
TypInfFlowBuilder >> nodeAt: aNode [

	^ nodes at: aNode ifAbsentPut: [ aNode typInfFlow ]
]

{ #category : #accessing }
TypInfFlowBuilder >> state [

	^ self stateSelf: root node methodClass typAsType
]

{ #category : #accessing }
TypInfFlowBuilder >> stateSelf: aType [

	^ self stateSelf: aType super: aType super
]

{ #category : #accessing }
TypInfFlowBuilder >> stateSelf: aType super: anotherType [

	^ TypInfFlowState nodes: nodes values self: aType super: anotherType
]

{ #category : #visiting }
TypInfFlowBuilder >> visitArgumentVariableNode: anArgumentNode [

	| node |
	node := super visitArgumentVariableNode: anArgumentNode.
	anArgumentNode isDefinition ifFalse: [ 
		node read: (self nodeAt: anArgumentNode definingNode) ].
	^ node
]

{ #category : #visiting }
TypInfFlowBuilder >> visitArrayNode: anArrayNode [

	| arguments |
	arguments := anArrayNode statements collect: [ :n | 
		             self visitNode: n ].
	self next: anArrayNode.
	current arguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitAssignmentNode: anAssignmentNode [

	self visitNode: anAssignmentNode value.
	self next: anAssignmentNode.
	current write: (self nodeAt: anAssignmentNode variable).
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitBlockNode: aBlockNode [

	self next: aBlockNode.
	current arguments:
		(aBlockNode arguments collect: [ :n | self nodeAt: n ]).
	self visitNode: aBlockNode body.
	^ current := self nodeAt: aBlockNode
]

{ #category : #visiting }
TypInfFlowBuilder >> visitCascadeNode: aCascadeNode [

	^ (aCascadeNode messages collect: [ :e | self visitNode: e ]) last
]

{ #category : #visiting }
TypInfFlowBuilder >> visitLiteralArrayNode: aLiteralArrayNode [

	| arguments |
	arguments := aLiteralArrayNode contents collect: [ :n | 
		             self visitNode: n ].
	self next: aLiteralArrayNode.
	current arguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitLiteralValueNode: aNode [

	^ self next: aNode
]

{ #category : #visiting }
TypInfFlowBuilder >> visitMessageNode: aMessageNode [

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
TypInfFlowBuilder >> visitMethodNode: aMethodNode [

	self assert: [ root isNil ].
	self assert: [ current isNil ].
	root := self nodeAt: aMethodNode.
	current := root.
	current arguments:
		(aMethodNode arguments collect: [ :n | self nodeAt: n ]).
	self visitNode: aMethodNode body.
	aMethodNode lastIsReturn ifFalse: [ current returnSelf: root ].
	^ root
]

{ #category : #visiting }
TypInfFlowBuilder >> visitReturnNode: aReturnNode [

	self visitNode: aReturnNode value.
	^ current return: root
]

{ #category : #visiting }
TypInfFlowBuilder >> visitSequenceNode: aSequenceNode [

	current := current execute: (self nodeAt: aSequenceNode).
	current arguments:
		(aSequenceNode temporaries collect: [ :n | self nodeAt: n ]).
	aSequenceNode statements do: [ :n | self visitNode: n ]
]

{ #category : #visiting }
TypInfFlowBuilder >> visitTemporaryVariableNode: aTemproraryNode [

	| node |
	node := super visitTemporaryVariableNode: aTemproraryNode.
	aTemproraryNode isDefinition ifFalse: [ 
		node read: (self nodeAt: aTemproraryNode definingNode) ].
	^ node
]

{ #category : #visiting }
TypInfFlowBuilder >> visitVariableNode: aVariableNode [

	^ self next: aVariableNode
]
