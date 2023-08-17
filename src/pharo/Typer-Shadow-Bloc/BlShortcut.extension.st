Extension { #name : #BlShortcut }

{ #category : #'*Typer-Shadow-Bloc' }
BlShortcut >> typShaMethodAction: aLookup [
	<typShaMethod: 'action:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlShortcut typAsType
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BlElement typAsType}
					argumentsOptional: true
					signalsAlways: false}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlShortcut >> typShaMethodCombination: aLookup [
	<typShaMethod: 'combination:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlKeyCombination typAsType}
]
