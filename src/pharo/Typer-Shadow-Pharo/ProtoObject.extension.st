Extension { #name : #ProtoObject }

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodBinaryIdentical: aLookup root: anotherLookup [
	<typShaMethod: '=='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodBinaryNotIdentical: aLookup root: anotherLookup [
	<typShaMethod: '~~'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {TypUnknownType instance asNullable}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodKeywordFlag: aLookup root: anotherLookup [
	<typShaMethod: 'flag:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ProtoObject >> typShaMethodUnaryClass: aLookup root: anotherLookup [
	<typShaMethod: 'class'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: anotherLookup receiver classDescription class typAsType
]
