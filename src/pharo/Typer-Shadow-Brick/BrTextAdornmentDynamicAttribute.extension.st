Extension { #name : #BrTextAdornmentDynamicAttribute }

{ #category : #'*Typer-Shadow-Brick' }
BrTextAdornmentDynamicAttribute >> typShaMethodKeywordStencil: aLookup [
	<typShaMethod: 'stencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure typAsFunctionTypeWithResult: BlElement typAsType}
]
