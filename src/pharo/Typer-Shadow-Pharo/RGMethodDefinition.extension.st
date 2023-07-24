Extension { #name : #RGMethodDefinition }

{ #category : #'*Typer-Shadow-Pharo' }
RGMethodDefinition >> typShaMethodCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType asNullable
]
