Extension { #name : #BrTextAdornmentDynamicAttribute }

{ #category : #'*Typer-Shadow-Brick' }
BrTextAdornmentDynamicAttribute >> typShaMethodKeywordStencil: aLookup root: anotherLookup [
	<typShaMethod: 'stencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure typAsFunctionTypeWithResult: BlElement typAsType}
]
