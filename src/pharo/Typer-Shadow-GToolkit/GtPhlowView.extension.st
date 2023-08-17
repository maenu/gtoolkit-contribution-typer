Extension { #name : #GtPhlowView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowView >> typShaMethodActionStencil: aLookup [
	<typShaMethod: 'actionStencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure typAsFunctionTypeWithResult: BlElement typAsType}
]
