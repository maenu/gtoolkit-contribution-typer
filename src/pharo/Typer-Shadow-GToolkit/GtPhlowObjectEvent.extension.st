Extension { #name : #GtPhlowObjectEvent }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowObjectEvent >> typShaMethodObject: aLookup [
	<typShaMethod: 'object:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Object typAsType asNullable}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowObjectEvent >> typShaMethodSourceElement: aLookup [
	<typShaMethod: 'sourceElement:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlElement typAsType}
]
