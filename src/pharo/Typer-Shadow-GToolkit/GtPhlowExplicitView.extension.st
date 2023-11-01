Extension { #name : #GtPhlowExplicitView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowExplicitView >> typShaMethodKeywordStencil: aLookup root: anotherLookup [
	<typShaMethod: 'stencil:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure typAsFunctionTypeWithResult: BlElement typAsType}
]
