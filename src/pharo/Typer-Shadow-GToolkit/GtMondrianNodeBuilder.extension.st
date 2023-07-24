Extension { #name : #GtMondrianNodeBuilder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtMondrianNodeBuilder >> typShaMethodWith: aLookup [
	<typShaMethod: 'with:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ((aLookup arguments at: 1) withParameters: {BlElement typAsType})
		arguments: {Collection typAsType}
]
