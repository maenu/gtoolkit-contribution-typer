Class {
	#name : #TypShaPhaNumber,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
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

{ #category : #accessing }
TypShaPhaNumber >> _to: _a do: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Number typAsType ]
				ifFalse: [ BlockClosure typAsType
						asParametricType:
							{Number typAsType.
							TypUnknownType instance} ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaNumber >> ~- _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | Number typAsType ];
		yourself
]
