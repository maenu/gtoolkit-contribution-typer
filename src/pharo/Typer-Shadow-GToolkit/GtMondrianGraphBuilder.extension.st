Extension { #name : #GtMondrianGraphBuilder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrianGraphBuilder >> typShaMethodKeywordStencil: aLookup [
	<typShaMethod: 'stencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: BlElement typAsType
					arguments: {TypUnknownType instance}}
]
