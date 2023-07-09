Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfBlock >> initialize: aState [
	super initialize: aState.
	state
		at: self
		put: ((BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType instance
				arguments: (node arguments collect: [ :e | TypUnknownType instance ])
				argumentsOptional: false
				signalsAlways: nil)
				typInfNode: self;
				yourself)
]
