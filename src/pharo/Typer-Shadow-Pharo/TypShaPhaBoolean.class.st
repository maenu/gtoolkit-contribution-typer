Class {
	#name : #TypShaPhaBoolean,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBoolean class >> shadowedClass [
	^ Boolean class
]

{ #category : #'as yet unclassified' }
TypShaPhaBoolean >> ___and: _a [
	^ TypMethodResolver new
		argumentTypes: [ BlockClosure typAsType asParametricType: {Boolean typAsType} ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBoolean >> ___ifTrue: _a ifFalse: _b [
	^ TypMethodResolver new
		argumentTypes: [ BlockClosure typAsType asParametricType: {TypUnknownType instance} ];
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
			resultType asType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBoolean >> ___not [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaBoolean >> ___or: _a [
	^ TypMethodResolver new
		argumentTypes: [ BlockClosure typAsType asParametricType: {Boolean typAsType} ];
		resultType: [ Boolean typAsType ];
		yourself
]
