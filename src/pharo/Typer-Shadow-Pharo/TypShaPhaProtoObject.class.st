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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType new asNullable}
]

{ #category : #shadow }
TypShaPhaProtoObject >> mBinary288: aLookup [
	<typShaMethod: '~~'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType new asNullable}
]

{ #category : #shadow }
TypShaPhaProtoObject >> mClass: aLookup [
	<typShaMethod: 'class'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			aLookup receiver classDescription class typAsType
]

{ #category : #shadow }
TypShaPhaProtoObject >> mFlag: aLookup [
	<typShaMethod: 'flag:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIfNil: aLookup [
	<typShaMethod: 'ifNil:'>
	^ TypFunctionType new
		argumentTypes:
				[ :i :a :s :r | BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ];
		resultType: [ :a :s :r | 
			{a receiver asNonNullable.
			a argumentTypes first result} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIfNilIfNotNil: aLookup [
	<typShaMethod: 'ifNil:ifNotNil:'>
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ]
				ifFalse: [ {Symbol typAsType.
					(BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {a receiver asNonNullable}
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
										receiverType: ('@A' typAsVariableType resolveIn: a receiver);
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
				arguments: {a receiver asNonNullable}
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
										receiverType: a receiver;
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
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
