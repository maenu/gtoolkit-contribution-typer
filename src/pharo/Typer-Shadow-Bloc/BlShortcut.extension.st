Extension { #name : #BlShortcut }

{ #category : #'*Typer-Shadow-Bloc' }
BlShortcut >> typShaMethodKeywordCombination: aLookup root: anotherLookup [
	<typShaMethod: 'combination:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlKeyCombination typAsType}
]
