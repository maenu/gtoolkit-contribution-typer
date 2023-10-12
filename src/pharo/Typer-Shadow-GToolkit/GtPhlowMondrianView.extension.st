Extension { #name : #GtPhlowMondrianView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowMondrianView >> typShaMethodKeywordPainting: aLookup [
	<typShaMethod: 'painting:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {GtMondrian typAsType}}
]
