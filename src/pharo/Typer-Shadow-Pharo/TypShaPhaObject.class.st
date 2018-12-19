Class {
	#name : #TypShaPhaObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaObject class >> shadowedClass [
	^ Object class
]

{ #category : #accessing }
TypShaPhaObject >> ___asString [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___asSymbol [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___assert: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType: {}
				result: Boolean typAsType
				optionalParameters: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___at: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___class [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | ClassDescription typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___copy [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___hash [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___ifNil: _a ifNotNil: _b [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ]
				ifFalse: [ {String typAsType.
					(BlockClosure typAsType asFunctionType: {a receiverType} result: TypUnknownType instance optionalParameters: true)} typAsType ] ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodResolvers global
								typeForResultOfMethod:
									(TypMethodLookup new
										receiverType: a receiverType;
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			{(a argumentTypes at: 1) result.
			elementType} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___isBlock [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___isKindOf: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | {ClassDescription typAsType} at: i ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___isNotNil [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaObject >> ___printOn: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Stream typAsType asParametricType: {Character typAsType} ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___printString [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ___yourself [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ~~~-> _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | a argumentTypes at: 1 ];
		resultType: [ :a :s :r | 
			Association typAsType
				asParametricType:
					{a receiverType.
					(a argumentTypes at: 1)} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaObject >> ~~~= _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Object typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
