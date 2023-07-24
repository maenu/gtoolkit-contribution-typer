Extension { #name : #ReflectiveMethod }

{ #category : #'*Typer-Shadow-Pharo' }
ReflectiveMethod >> typShaMethodCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]
