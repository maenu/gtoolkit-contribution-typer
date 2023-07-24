Extension { #name : #GtMondrianGraphBuilder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrianGraphBuilder >> typShaMethodStencil: aLookup [
	<typShaMethod: 'stencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: BlElement typAsType
					arguments: {TypUnknownType instance}}
]
