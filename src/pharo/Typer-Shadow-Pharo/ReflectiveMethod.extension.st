Extension { #name : #ReflectiveMethod }

{ #category : #'*Typer-Shadow-Pharo' }
ReflectiveMethod >> typShaMethodUnaryCompiledMethod: aLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]
