Class {
	#name : #TypShaPhaProtoObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaProtoObject class >> shadowedClass [
	^ ProtoObject class
]

{ #category : #accessing }
TypShaPhaProtoObject >> ___class [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType asClass class typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaProtoObject >> ___flag: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaProtoObject >> ___ifNil: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure typAsType
				asFunctionType: {}
				result: TypUnknownType instance
				optionalParameters: false ];
		resultType: [ :a :s :r | 
			| node |
			node := a argumentNodes at: 1.
			(node isBlock
				and: [ node body statements size > 0 and: [ node body statements last isReturn ] ])
				ifTrue: [ a receiverType asNonNullableType ]
				ifFalse: [ {a receiverType.
					(a argumentTypes at: 1) result} typAsType ] ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaProtoObject >> ___ifNil: _a ifNotNil: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlockClosure typAsType asFunctionType: {} result: TypUnknownType instance optionalParameters: false ]
				ifFalse: [ {String typAsType.
					(BlockClosure typAsType asFunctionType: {a receiverType asNonNullableType} result: TypUnknownType instance optionalParameters: true)} typAsType ] ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								typeForResultOfMethod:
									(TypMethodLookup new
										receiverType: (a receiverType parameters at: 1);
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
TypShaPhaProtoObject >> ___ifNotNil: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{String typAsType.
			(BlockClosure typAsType asFunctionType: {a receiverType asNonNullableType} result: TypUnknownType instance optionalParameters: true)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode) and: [ (argumentNode value isKindOf: String) and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								typeForResultOfMethod:
									(TypMethodLookup new
										receiverType: (a receiverType parameters at: 1);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ].
			{a receiverType.
			elementType} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaProtoObject >> ___isNil [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaProtoObject >> ~~~== _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | TypUnknownType instance asNullableType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaProtoObject >> ~~~~~ _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | TypUnknownType instance asNullableType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
