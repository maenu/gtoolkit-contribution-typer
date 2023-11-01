Extension { #name : #GtPhlowObjectEvent }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowObjectEvent >> typShaMethodKeywordObject: aLookup root: anotherLookup [
	<typShaMethod: 'object:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Object typAsType asNullable}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowObjectEvent >> typShaMethodKeywordSourceElement: aLookup root: anotherLookup [
	<typShaMethod: 'sourceElement:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlElement typAsType}
]
