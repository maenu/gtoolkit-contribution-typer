Extension { #name : #GtPhlowObjectEvent }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowObjectEvent >> typShaMethodObject: aLookup [
	<typShaMethod: 'object:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Object typAsType asNullable}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPhlowObjectEvent >> typShaMethodSourceElement: aLookup [
	<typShaMethod: 'sourceElement:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlElement typAsType}
]
