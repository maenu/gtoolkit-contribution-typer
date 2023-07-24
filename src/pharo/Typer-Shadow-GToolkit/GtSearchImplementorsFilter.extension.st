Extension { #name : #GtSearchImplementorsFilter }

{ #category : #'*Typer-Shadow-GToolkit' }
GtSearchImplementorsFilter class >> typShaMethodSelector: aLookup [
	<typShaMethod: 'selector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {Symbol typAsType}
]
