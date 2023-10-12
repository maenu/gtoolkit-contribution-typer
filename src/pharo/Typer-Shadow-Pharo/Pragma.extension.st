Extension { #name : #Pragma }

{ #category : #'*Typer-Shadow-Pharo' }
Pragma >> typShaMethodUnaryArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType
				withParameters: {{String typAsType.
							Symbol typAsType.
							Number typAsType.
							Boolean typAsType} typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Pragma >> typShaMethodUnarySelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
