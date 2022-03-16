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
TypInfBlock >> tightenTo: aType in: aState [

	| type |
	type := aType.
	type isUnion ifTrue: [ 
		aType types detect: #isFunction ifFound: [ :t | type := t ] ].
	type isFunction ifFalse: [ ^ self ].
	self incomingArguments withIndexDo: [ :n :i | 
		i <= type arguments size ifTrue: [ 
			self tighten: n to: (type arguments at: i) in: aState ] ].
	self tighten: self incomingReturn to: type result in: aState
]
