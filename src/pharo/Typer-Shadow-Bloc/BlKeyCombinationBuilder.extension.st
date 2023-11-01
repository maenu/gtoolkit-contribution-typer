Extension { #name : #BlKeyCombinationBuilder }

{ #category : #'*Typer-Shadow-Bloc' }
BlKeyCombinationBuilder >> typShaMethodKeywordKey: aLookup root: anotherLookup [
	<typShaMethod: 'key:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlKeyboardKey typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlKeyCombinationBuilder >> typShaMethodUnaryBuild: aLookup root: anotherLookup [
	<typShaMethod: 'build'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyCombination typAsType
]
