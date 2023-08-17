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
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType}
]
