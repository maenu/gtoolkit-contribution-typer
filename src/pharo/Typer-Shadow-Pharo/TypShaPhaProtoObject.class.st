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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup receiver asNonNullable.
			aLookup arguments first result} typAsType
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIfNilIfNotNil: aLookup [
	<typShaMethod: 'ifNil:ifNotNil:'>
	^ TypFunctionType new
		argumentTypes:
			{BlockClosure typAsType.
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {aLookup receiver asNonNullable}
				argumentsOptional: true
				signalsAlways: false)} typAsType};
		resultType: [ :a :s :r | 
			| argumentType argumentNode elementType |
			argumentType := aLookup arguments at: 2.
			argumentNode := aLookup argumentNodes at: 2.
			elementType := argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: (aLookup receiver at: '@A');
										selector: argumentNode value asSymbol;
										argumentTypes: {};
										argumentNodes: {};
										yourself) ]
						ifFalse: [ TypUnknownType new ] ].
			{(aLookup arguments at: 1) result.
			elementType} typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIfNotNil: aLookup [
	<typShaMethod: 'ifNotNil:'>
	^ TypFunctionType new
		argumentTypes: [ {Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {aLookup receiver asNonNullable}
				argumentsOptional: true
				signalsAlways: false)} typAsType ];
		resultType: [ :a :s :r | 
			| argumentType argumentNode |
			argumentType := aLookup arguments at: 1.
			argumentNode := aLookup argumentNodes at: 1.
			argumentType isFunction
				ifTrue: [ argumentType result ]
				ifFalse: [ ((argumentNode isKindOf: RBLiteralValueNode)
						and: [ (argumentNode value isKindOf: Symbol)
								and: [ argumentNode value asSymbol isUnary ] ])
						ifTrue: [ TypMethodLookupIndex instance
								resultTypeFor:
									(TypMethodLookup new
										receiverType: aLookup receiver;
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
