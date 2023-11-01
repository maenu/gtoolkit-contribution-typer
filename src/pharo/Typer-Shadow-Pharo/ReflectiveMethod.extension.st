Extension { #name : #ReflectiveMethod }

{ #category : #'*Typer-Shadow-Pharo' }
ReflectiveMethod >> typShaMethodUnaryCompiledMethod: aLookup root: anotherLookup [
	<typShaMethod: 'compiledMethod'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]
