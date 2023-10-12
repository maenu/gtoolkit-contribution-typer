Extension { #name : #GtPhlowView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowView >> typShaMethodKeywordActionStencil: aLookup [
	<typShaMethod: 'actionStencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure typAsFunctionTypeWithResult: BlElement typAsType}
]
