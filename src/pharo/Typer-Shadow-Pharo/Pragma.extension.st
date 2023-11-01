Extension { #name : #Pragma }

{ #category : #'*Typer-Shadow-Pharo' }
Pragma >> typShaMethodUnaryArguments: aLookup root: anotherLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType
				withParameters: {{String typAsType.
							Symbol typAsType.
							Number typAsType.
							Boolean typAsType} typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Pragma >> typShaMethodUnarySelector: aLookup root: anotherLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
