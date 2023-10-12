Extension { #name : #BlKeyCombinationBuilder }

{ #category : #'*Typer-Shadow-Bloc' }
BlKeyCombinationBuilder >> typShaMethodKeywordKey: aLookup [
	<typShaMethod: 'key:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlKeyboardKey typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlKeyCombinationBuilder >> typShaMethodUnaryBuild: aLookup [
	<typShaMethod: 'build'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyCombination typAsType
]
