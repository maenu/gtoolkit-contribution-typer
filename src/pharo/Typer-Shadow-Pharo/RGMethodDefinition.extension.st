Extension { #name : #RGMethodDefinition }

{ #category : #'*Typer-Shadow-Pharo' }
RGMethodDefinition >> typShaMethodUnaryCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType asNullable
]
