Extension { #name : #GtPhlowMondrianView }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowMondrianView >> typShaMethodPainting: aLookup [
	<typShaMethod: 'painting:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {GtMondrian typAsType}}
]
