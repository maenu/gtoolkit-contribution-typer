Extension { #name : #GtSearchImplementorsFilter }

{ #category : #'*Typer-Shadow-GToolkit' }
GtSearchImplementorsFilter class >> typShaMethodKeywordSelector: aLookup [
	<typShaMethod: 'selector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {Symbol typAsType}
]
