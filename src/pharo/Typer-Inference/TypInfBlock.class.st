Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfBlock >> constrainTo: aType [

	| type |
	type := aType.
	type isUnion ifTrue: [ 
		aType types detect: #isFunction ifFound: [ :t | type := t ] ].
	type isFunction ifFalse: [ ^ self ].
	self incomingArguments withIndexDo: [ :n :i | 
		i <= type arguments size ifTrue: [ 
			self constrain: n to: (type arguments at: i) ] ].
	self constrain: self incomingReturnBlock to: type result
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
