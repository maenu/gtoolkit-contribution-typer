Class {
	#name : #TypInfFlowBuilder,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'root',
		'current',
		'nodes',
		'selfType',
		'superType'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #initialization }
TypInfFlowBuilder >> initialize [

	super initialize.
	nodes := IdentityDictionary new
]

{ #category : #accessing }
TypInfFlowBuilder >> nodeAt: aNode [

	^ nodes at: aNode ifAbsentPut: [ aNode typInfFlow ]
]

{ #category : #visiting }
TypInfFlowBuilder >> visitArgumentVariableNode: anArgumentNode [

	| node |
	node := super visitArgumentVariableNode: anArgumentNode.
	anArgumentNode isDefinition ifFalse: [ 
		node read: (self nodeAt:
				 ((anArgumentNode whoDefines: anArgumentNode name) arguments 
					  detect: [ :e | e = anArgumentNode ])) ].
	^ node
]

{ #category : #visiting }
TypInfFlowBuilder >> visitArrayNode: anArrayNode [

	| arguments |
	arguments := anArrayNode children collect: [ :n | self visitNode: n ].
	current := current next: (self nodeAt: anArrayNode).
	current arguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitAssignmentNode: anAssignmentNode [

	self visitNode: anAssignmentNode value.
	current := current next: (self nodeAt: anAssignmentNode).
	current write: (self nodeAt: anAssignmentNode variable).
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitBlockNode: aBlockNode [

	current := current next: (self nodeAt: aBlockNode).
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
	current := current next: (self nodeAt: aLiteralArrayNode).
	current arguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitLiteralNode: aLiteralNode [

	^ current := current next: (self nodeAt: aLiteralNode)
]

{ #category : #visiting }
TypInfFlowBuilder >> visitMessageNode: aMessageNode [

	| arguments |
	(aMessageNode isCascaded not or: [ aMessageNode isFirstCascaded ]) 
		ifTrue: [ self visitNode: aMessageNode receiver ].
	arguments := aMessageNode arguments collect: [ :n | 
		             self visitNode: n ].
	current := current next: (self nodeAt: aMessageNode).
	current arguments: arguments.
	current receiver: (self nodeAt: aMessageNode receiver).
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitMethodNode: aMethodNode [

	self assert: [ root isNil ].
	self assert: [ current isNil ].
	selfType ifNil: [ selfType := aMethodNode methodClass typAsType ].
	superType ifNil: [ superType := selfType super ].
	root := self nodeAt: aMethodNode.
	current := root.
	current arguments:
		(aMethodNode arguments collect: [ :n | self nodeAt: n ]).
	self visitNode: aMethodNode body.
	aMethodNode lastIsReturn ifFalse: [ current returnSelfTo: root ].
	^ root
]

{ #category : #visiting }
TypInfFlowBuilder >> visitReturnNode: aReturnNode [

	self visitNode: aReturnNode value.
	^ current returnTo: root
]

{ #category : #visiting }
TypInfFlowBuilder >> visitSelfNode: aNode [

	self visitVariableNode: aNode.
	current type: selfType.
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitSequenceNode: aSequenceNode [

	current := current execute: (self nodeAt: aSequenceNode).
	current arguments:
		(aSequenceNode temporaries collect: [ :n | self nodeAt: n ]).
	aSequenceNode statements do: [ :n | self visitNode: n ]
]

{ #category : #visiting }
TypInfFlowBuilder >> visitSuperNode: aNode [

	self visitVariableNode: aNode.
	current type: superType.
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitTemporaryVariableNode: aTemproraryNode [

	| node |
	node := super visitTemporaryVariableNode: aTemproraryNode.
	aTemproraryNode isDefinition ifFalse: [ 
		node read: (self nodeAt:
				 ((aTemproraryNode whoDefines: aTemproraryNode name) temporaries 
					  detect: [ :e | e = aTemproraryNode ])) ].
	^ node
]

{ #category : #visiting }
TypInfFlowBuilder >> visitThisContextNode: aNode [

	self visitVariableNode: aNode.
	current type: Context typAsType.
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitVariableNode: aVariableNode [

	^ current := current next: (self nodeAt: aVariableNode)
]
