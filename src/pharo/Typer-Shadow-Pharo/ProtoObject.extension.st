Extension { #name : #ProtoObject }

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodBinary284: aLookup [
	<typShaMethod: '=='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodBinary288: aLookup [
	<typShaMethod: '~~'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodClass: aLookup [
	<typShaMethod: 'class'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver classDescription class typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodFlag: aLookup [
	<typShaMethod: 'flag:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodIfNil: aLookup [
	<typShaMethod: 'ifNil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup root receiver asNonNullable.
				aLookup arguments first result} typAsType
		arguments: {BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodIfNilIfNotNil: aLookup [
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
		typAsFunctionTypeWithResult: {a1 result.
				r2} typAsType
		arguments: {BlockClosure typAsType.
				{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: {aLookup root receiver asNonNullable}
						argumentsOptional: true
						signalsAlways: false} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodIfNotNil: aLookup [
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
		arguments: {{Symbol typAsType.
					BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType instance
						arguments: {aLookup root receiver asNonNullable}
						argumentsOptional: true
						signalsAlways: false} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodIsNil: aLookup [
	<typShaMethod: 'isNil'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
