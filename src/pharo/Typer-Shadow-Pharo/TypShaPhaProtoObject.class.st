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
		resultType: [ :a :s :r | a receiverType classDescription class typAsType ];
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
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType instance
				argumentsOptional: false ];
		resultType: [ :a :s :r | 
			{a receiverType asNonNullableType.
			a argumentTypes first result} typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaProtoObject >> ___ifNil: _a ifNotNil: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlockClosure
						typAsFunctionTypeWithArguments: {}
						result: TypUnknownType instance
						argumentsOptional: false ]
				ifFalse: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithArguments: {a receiverType asNonNullableType}
						result: TypUnknownType instance
						argumentsOptional: true)} typAsType ] ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := a argumentTypes at: 2.
			argumentNode := a argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: ('@A' typAsTypeVariableType resolveIn: a receiverType);
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
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithArguments: {a receiverType asNonNullableType}
				result: TypUnknownType instance
				argumentsOptional: true)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode |
			argumentType := a argumentTypes at: 1.
			argumentNode := a argumentNodes at: 1.
			argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: a receiverType;
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType instance ] ] ];
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
