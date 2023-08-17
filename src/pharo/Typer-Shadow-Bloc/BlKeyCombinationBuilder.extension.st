Extension { #name : #BlKeyCombinationBuilder }

{ #category : #'*Typer-Shadow-Bloc' }
BlKeyCombinationBuilder >> typShaMethodBuild: aLookup [
	<typShaMethod: 'build'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyCombination typAsType
]

{ #category : #'*Typer-Shadow-Bloc' }
BlKeyCombinationBuilder >> typShaMethodKey: aLookup [
	<typShaMethod: 'key:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlKeyboardKey typAsType}
]
