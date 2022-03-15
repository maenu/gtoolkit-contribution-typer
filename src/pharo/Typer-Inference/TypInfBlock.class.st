Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfBlock >> constrainTo: aType in: aState [

	| type |
	type := aType.
	type isUnion ifTrue: [ 
		aType types detect: #isFunction ifFound: [ :t | type := t ] ].
	type isFunction ifFalse: [ ^ self ].
	self incomingArguments withIndexDo: [ :n :i | 
		i <= type arguments size ifTrue: [ 
			self constrain: n to: (type arguments at: i) in: aState ] ].
	self constrain: self incomingReturnBlock to: type result in: aState
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

{ #category : #accessing }
TypInfBlock >> transfer [

	| type |
	type := state at: self.
	state at: self put: (BlockClosure
			 typAsFunctionTypeWithResult: self incomingReturnBlock type
			 arguments: (self incomingArguments collect: #type)
			 argumentsOptional: false
			 signalsAlways: nil).
	TypInfSignal
		emitMessage: 'transfer'
		from: type
		to: (state at: self)
		node: self
]
