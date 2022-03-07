Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfBlock >> constrain: aNode to: aType in: aState [

	| type |
	type := super constrain: aNode to: aType in: aState.
	aNode == self ifFalse: [ ^ type ].
	type isUnion ifTrue: [ 
		aType types detect: #isFunction ifFound: [ :t | type := t ] ].
	type isFunction ifFalse: [ ^ type ].
	self incomingArguments withIndexDo: [ :n :i | 
		i <= type arguments size ifTrue: [ 
			self constrain: n to: (type arguments at: i) in: aState ] ].
	self constrain: self incomingReturnBlock to: type result in: aState.
	^ type
]

{ #category : #'as yet unclassified' }
TypInfBlock >> incomingReturnBlock [

	^ self incomingAt: #returnBlock
]

{ #category : #accessing }
TypInfBlock >> initialize: aState [

	state := aState.
	^ state at: self put: (BlockClosure
			   typAsFunctionTypeWithResult: TypUnknownType instance
			   arguments:
			   (node arguments collect: [ :e | TypUnknownType instance ])
			   argumentsOptional: false
			   signalsAlways: nil)
]

{ #category : #execution }
TypInfBlock >> ougoingExecute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfBlock >> ougoingExecute: aNode [

	^ self outgoingAt: #execute put: aNode
]

{ #category : #accessing }
TypInfBlock >> transfer [

	| type |
	type := BlockClosure
		        typAsFunctionTypeWithResult:
		        (state at: self incomingReturnBlock)
		        arguments:
		        (self incomingArguments collect: [ :a | state at: a ])
		        argumentsOptional: false
		        signalsAlways: nil.
	state at: self put: type
]
