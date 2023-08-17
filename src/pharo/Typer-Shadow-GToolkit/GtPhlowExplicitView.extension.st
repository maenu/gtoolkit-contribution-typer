Extension { #name : #GtPhlowExplicitView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowExplicitView >> typShaMethodStencil: aLookup [
	<typShaMethod: 'stencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure typAsFunctionTypeWithResult: BlElement typAsType}
]
