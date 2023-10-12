Extension { #name : #BlShortcut }

{ #category : #'*Typer-Shadow-Bloc' }
BlShortcut >> typShaMethodKeywordCombination: aLookup [
	<typShaMethod: 'combination:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlKeyCombination typAsType}
]
