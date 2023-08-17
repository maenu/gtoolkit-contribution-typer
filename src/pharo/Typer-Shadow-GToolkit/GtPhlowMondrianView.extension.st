Extension { #name : #GtPhlowMondrianView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowMondrianView >> typShaMethodPainting: aLookup [
	<typShaMethod: 'painting:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {GtMondrian typAsType}}
]
