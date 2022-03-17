Class {
	#name : #TypInfBlock,
	#superclass : #TypInfNode,
	#traits : 'TTypInfWithArguments',
	#classTraits : 'TTypInfWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfBlock >> incomingReturn [

	^ ((incoming at: #tighten) detect: #isReturn) origin
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

{ #category : #'as yet unclassified' }
TypInfBlock >> tighten: aType in: aState [

	self incomingArguments withIndexDo: [ :n :i | 
		i <= aType arguments size ifTrue: [ 
			aState tightenFrom: self to: n with: (aType arguments at: i) ] ].
	aState tightenFrom: self to: self incomingReturn with: aType result
]
