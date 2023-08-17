Extension { #name : #GtMondrianGraphBuilder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrianGraphBuilder >> typShaMethodStencil: aLookup [
	<typShaMethod: 'stencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: BlElement typAsType
					arguments: {TypUnknownType instance}}
]
