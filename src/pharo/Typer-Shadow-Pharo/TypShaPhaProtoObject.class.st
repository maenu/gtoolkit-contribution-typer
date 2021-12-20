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
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType new asNullable}
]

{ #category : #shadow }
TypShaPhaProtoObject >> mBinary288: aLookup [
	<typShaMethod: '~~'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType new asNullable}
]

{ #category : #shadow }
TypShaPhaProtoObject >> mClass: aLookup [
	<typShaMethod: 'class'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription class typAsType
]

{ #category : #shadow }
TypShaPhaProtoObject >> mFlag: aLookup [
	<typShaMethod: 'flag:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIfNil: aLookup [
	<typShaMethod: 'ifNil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup root receiver asNonNullable.
			aLookup arguments first result} typAsType
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIfNilIfNotNil: aLookup [
	<typShaMethod: 'ifNil:ifNotNil:'>
	| a1 a2 r2 |
	a1 := aLookup arguments at: 1.
	a2 := aLookup arguments at: 2.
	r2 := (a2 isValue and: [ a2 value isString ])
		ifTrue: [ (aLookup root receiver asNonNullable
				lookupMethod: a2 value asSymbol
				arguments: {aLookup root receiver asNonNullable}) result ]
		ifFalse: [ a2 result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{a1 result.
			r2} typAsType
		arguments:
			{BlockClosure typAsType.
			{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {aLookup root receiver asNonNullable}
				argumentsOptional: true
				signalsAlways: false)} typAsType}
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIfNotNil: aLookup [
	<typShaMethod: 'ifNotNil:'>
	| a r |
	a := aLookup arguments at: 1.
	r := (a isValue and: [ a value isString ])
		ifTrue: [ (aLookup root receiver asNonNullable
				lookupMethod: a value asSymbol
				arguments: {aLookup root receiver}) result ]
		ifFalse: [ a result ].
	^ CompiledMethod
		typAsFunctionTypeWithResult: r
		arguments:
			{{Symbol typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {aLookup root receiver asNonNullable}
				argumentsOptional: true
				signalsAlways: false)} typAsType}
]

{ #category : #shadow }
TypShaPhaProtoObject >> mIsNil: aLookup [
	<typShaMethod: 'isNil'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
