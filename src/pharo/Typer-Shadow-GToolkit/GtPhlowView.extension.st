Extension { #name : #GtPhlowView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowView >> typShaMethodActionStencil: aLookup [
	<typShaMethod: 'actionStencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure typAsFunctionTypeWithResult: BlElement typAsType}
]
