Extension { #name : #ProtoObject }

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodBinaryIdentical: aLookup [
	<typShaMethod: '=='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodBinaryNotIdentical: aLookup [
	<typShaMethod: '~~'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodKeywordFlag: aLookup [
	<typShaMethod: 'flag:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodUnaryClass: aLookup [
	<typShaMethod: 'class'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver classDescription class typAsType
]
