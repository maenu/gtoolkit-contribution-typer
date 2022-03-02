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

	nodes := IdentityDictionary new.
	aMethodNode acceptVisitor: self.
	state := TypInfState self: aType super: anotherType.
	nodes valuesDo: [ :e | e initialize: state ].
	nodes keysAndValuesDo: [ :n :e | 
		self outgoingAt: n put: e.
		e outgoingFlow do: [ :f | f state: state copy ] ]
]

{ #category : #accessing }
TypInfContext >> next: aNode [

	^ current := current next: (self nodeAt: aNode)
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

	| n nodes_ |
	nodes_ := nodes values.
	n := 100.
	[ 
	n := n - 1.
	(nodes_ inject: false into: [ :r :e | e slurpAndBurp or: r ]) and: [ 
		n > 0 ] ] whileTrue.
	nodes_ do: #type.
	stable := n > 0
]

{ #category : #visiting }
TypInfContext >> visitArgumentVariableNode: anArgumentNode [

	self visitLocalVariableNode: anArgumentNode.
	anArgumentNode isDefinition ifFalse: [ 
		current read: (self nodeAt: anArgumentNode variable definingNode) ].
	^ current
]

{ #category : #visiting }
TypInfContext >> visitArrayNode: anArrayNode [

	| arguments |
	arguments := anArrayNode statements collect: [ :n | 
		             self visitNode: n ].
	self next: anArrayNode.
	current arguments: arguments.
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

	self next: aBlockNode.
	current arguments:
		(aBlockNode arguments collect: [ :n | self nodeAt: n ]).
	self visitNode: aBlockNode body.
	^ current returnBlock: (self nodeAt: aBlockNode)
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
	current arguments: arguments.
	^ current
]

{ #category : #visiting }
TypInfContext >> visitLiteralValueNode: aNode [

	^ self next: aNode
]

{ #category : #visiting }
TypInfContext >> visitMessageNode: aMessageNode [

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
TypInfContext >> visitMethodNode: aMethodNode [

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
TypInfContext >> visitPragmaNode: aPragmaNode [

	"noop"

	
]

{ #category : #visiting }
TypInfContext >> visitReturnNode: aReturnNode [

	self visitNode: aReturnNode value.
	self next: aReturnNode.
	^ current return: root
]

{ #category : #visiting }
TypInfContext >> visitSequenceNode: aSequenceNode [

	current := current execute: (self nodeAt: aSequenceNode).
	current arguments:
		(aSequenceNode temporaries collect: [ :n | self nodeAt: n ]).
	aSequenceNode statements do: [ :n | self visitNode: n ]
]

{ #category : #visiting }
TypInfContext >> visitTemporaryVariableNode: aTemproraryNode [

	self visitLocalVariableNode: aTemproraryNode.
	aTemproraryNode isDefinition ifFalse: [ 
		current read: (self nodeAt: aTemproraryNode variable definingNode) ].
	^ current
]

{ #category : #visiting }
TypInfContext >> visitVariableNode: aVariableNode [

	^ self next: aVariableNode
]
