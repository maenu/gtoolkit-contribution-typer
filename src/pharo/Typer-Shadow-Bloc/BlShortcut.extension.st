Extension { #name : #BlShortcut }

{ #category : #'*Typer-Shadow-Bloc' }
BlShortcut >> typShaMethodCombination: aLookup [
	<typShaMethod: 'combination:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlKeyCombination typAsType}
]
