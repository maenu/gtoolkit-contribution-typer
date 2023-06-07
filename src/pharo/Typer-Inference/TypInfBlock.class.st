Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfBlock >> incomingReturn [

	^ ((incoming at: #tighten) detect: #isReturn) origin
]

{ #category : #accessing }
TypInfBlock >> initialize: aState [

	super initialize: aState.
	^ state at: self put: (BlockClosure
			   typAsFunctionTypeWithResult: TypUnknownType instance
			   arguments:
			   (node arguments collect: [ :e | TypUnknownType instance ])
			   argumentsOptional: false
			   signalsAlways: nil)
]

{ #category : #'as yet unclassified' }
TypInfBlock >> tighten: aType in: aState [

	self incomingArguments withIndexDo: [ :n :i | 
		i <= aType arguments size ifTrue: [ 
			aState covariantFrom: self to: n with: (aType arguments at: i) ] ].
	aState covariantFrom: self to: self incomingReturn with: aType result
]
