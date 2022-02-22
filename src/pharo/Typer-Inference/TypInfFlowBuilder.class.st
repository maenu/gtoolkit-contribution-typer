Class {
	#name : #TypInfFlowBuilder,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'root',
		'current',
		'nodes',
		'variables'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #initialization }
TypInfFlowBuilder >> initialize [

	super initialize.
	nodes := IdentityDictionary new.
	variables := Set new
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

	| state |
	state := Dictionary new.
	variables do: [ :e | state at: e put: TypUnknownType instance ].
	variables
		detect: #isSelfVariable
		ifFound: [ :e | state at: e put: aType ].
	variables
		detect: #isSuperVariable
		ifFound: [ :e | state at: e put: anotherType ].
	variables
		detect: #isThisContextVariable
		ifFound: [ :e | state at: e put: Context typInfType ].
	variables
		select: #isGlobalVariable
		thenDo: [ :e | state at: e put: e value typInfType ].
	^ state
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
	current := current next: (self nodeAt: anArrayNode).
	current arguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitAssignmentNode: anAssignmentNode [

	self visitNode: anAssignmentNode value.
	anAssignmentNode variable typInfFlowAddTo: variables.
	current := current next: (self nodeAt: anAssignmentNode).
	current write: (self nodeAt: anAssignmentNode variable).
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitBlockNode: aBlockNode [

	current := current next: (self nodeAt: aBlockNode).
	aBlockNode arguments do: [ :e | e typInfFlowAddTo: variables ].
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
	aLiteralArrayNode isForByteArray
		ifTrue: [ current type: ByteArray typAsType ]
		ifFalse: [ 
			current type: (Array typAsType withParameters:
					 { (arguments collect: #type) typAsType }) ].
	^ current
]

{ #category : #visiting }
TypInfFlowBuilder >> visitLiteralValueNode: aNode [

	current := current next: (self nodeAt: aNode).
	current type: aNode value typInfType.
	^ current
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
	root := self nodeAt: aMethodNode.
	aMethodNode arguments do: [ :e | e typInfFlowAddTo: variables ].
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
	aSequenceNode temporaries do: [ :e | e typInfFlowAddTo: variables ].
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

	aVariableNode typInfFlowAddTo: variables.
	^ current := current next: (self nodeAt: aVariableNode)
]
