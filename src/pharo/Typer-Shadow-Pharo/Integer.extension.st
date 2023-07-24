Extension { #name : #Integer }

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodAsCharacter: aLookup [
	<typShaMethod: 'asCharacter'>
	^ CompiledMethod typAsFunctionTypeWithResult: Character typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodAtRandom: aLookup [
	<typShaMethod: 'atRandom'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBitXor: aLookup [
	<typShaMethod: 'bitXor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]
