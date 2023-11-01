Extension { #name : #GtPhlowView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowView >> typShaMethodKeywordActionStencil: aLookup root: anotherLookup [
	<typShaMethod: 'actionStencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure typAsFunctionTypeWithResult: BlElement typAsType}
]
