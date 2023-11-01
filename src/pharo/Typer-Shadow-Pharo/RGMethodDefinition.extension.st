Extension { #name : #RGMethodDefinition }

{ #category : #'*Typer-Shadow-Pharo' }
RGMethodDefinition >> typShaMethodUnaryCompiledMethod: aLookup root: anotherLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType asNullable
]
