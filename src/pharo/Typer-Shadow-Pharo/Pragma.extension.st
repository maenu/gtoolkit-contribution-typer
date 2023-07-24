Extension { #name : #Pragma }

{ #category : #'*Typer-Shadow-Pharo' }
Pragma >> typShaMethodArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType
				withParameters: {{String typAsType.
							Symbol typAsType.
							Number typAsType.
							Boolean typAsType} typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Pragma >> typShaMethodSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
