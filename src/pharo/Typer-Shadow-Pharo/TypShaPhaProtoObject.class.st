Class {
	#name : #TypShaPhaProtoObject,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaProtoObject class >> shadowedClass [
	^ ProtoObject class
]

{ #category : #shadow }
TypShaPhaProtoObject >> mBinary284: aLookup [ 
	<typShaMethod: '=='>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | TypUnknownType new asNullable ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaProtoObject >> mBinary288: aLookup [ 
	<typShaMethod: '~~'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | TypUnknownType new asNullable ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaProtoObject >> mClass: aLookup [
	<typShaMethod: 'class'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType classDescription class typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaProtoObject >> mFlag: aLookup [
	<typShaMethod: 'flag:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIfNil: aLookup [ 
	<typShaMethod: 'ifNil:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | 
			{a receiverType asNonNullable.
			a argumentTypes first result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIfNilIfNotNil: aLookup [ 
	<typShaMethod: 'ifNil:ifNotNil:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ]
				ifFalse: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {a receiverType asNonNullable}
						argumentsOptional: true
						signalsAlways: false)} typAsType ] ];
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
										receiverType: ('@A' typAsVariableType resolveIn: a receiverType);
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			{(a argumentTypes at: 1) result.
			elementType} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIfNotNil: aLookup [ 
	<typShaMethod: 'ifNotNil:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {a receiverType asNonNullable}
				argumentsOptional: true
				signalsAlways: false)} typAsType ];
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
						ifFalse: [ TypUnknownType new ] ] ];
		yourself
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIsNil: aLookup [
	<typShaMethod: 'isNil'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
