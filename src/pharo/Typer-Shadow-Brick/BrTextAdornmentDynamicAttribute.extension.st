Extension { #name : #BrTextAdornmentDynamicAttribute }

{ #category : #'*Typer-Shadow-Brick' }
BrTextAdornmentDynamicAttribute >> typShaMethodStencil: aLookup [
	<typShaMethod: 'stencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure typAsFunctionTypeWithResult: BlElement typAsType}
]
