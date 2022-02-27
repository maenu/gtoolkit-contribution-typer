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
	self flag: 'accept multiple function types?'.
	type := aType.
	aType isUnion ifTrue: [ 
		aType types
			detect: #isFunction
			ifFound: [ :t | type := t ]
			ifNone: [ ^ super constrainTo: aType in: aState ] ].
	type isFunction ifFalse: [ ^ super constrainTo: aType in: aState ].
	self arguments withIndexDo: [ :n :i | 
		n
			constrainTo:
			(type arguments at: i ifAbsent: [ TypUnknownType instance ])
			in: aState ]
]

{ #category : #execution }
TypInfBlock >> execute [

	^ self outgoingAt: #execute
]

{ #category : #execution }
TypInfBlock >> execute: aNode [

	^ self outgoingAt: #execute put: aNode
]

{ #category : #accessing }
TypInfBlock >> initialize: aState [

	aState at: self put: (BlockClosure
			 typAsFunctionTypeWithResult: TypUnknownType instance
			 arguments:
			 (node arguments collect: [ :e | TypUnknownType instance ])
			 argumentsOptional: false
			 signalsAlways: nil)
]

{ #category : #accessing }
TypInfBlock >> transfer [

	| type |
	type := BlockClosure
		        typAsFunctionTypeWithResult: (incoming
				         select: [ :e | e data = #return ]
				         thenCollect: [ :e | state at: e origin ]) typAsType
		        arguments: (self arguments collect: [ :a | state at: a ])
		        argumentsOptional: false
		        signalsAlways: nil.
	state at: self put: type
]
