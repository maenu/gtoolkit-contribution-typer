Class {
	#name : #TypShaPhaNumber,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaNumber class >> shadowedClass [
	^ Number class
]

{ #category : #'as yet unclassified' }
TypShaPhaNumber >> _timesCollect: _a [
	^ TypMethodResolver new
		argumentTypes: [ BlockClosure typAsType
				asParametricType:
					{Integer typAsType.
					TypUnknownType instance} ];
		resultType: [ :a | 
			| resultType |
			resultType := a argumentTypes
				inject: TypUnionType new
				into: [ :e :f | 
					e
						increment:
							(f isParametric
								ifTrue: [ f parameters last	"typCastAs TypParametricType" ]
								ifFalse: [ TypUnknownType instance ]).
					e ].
			OrderedCollection typAsType asParametricType: {resultType asType} ];
		yourself
]
