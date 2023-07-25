Extension { #name : #ExternalType }

{ #category : #'*Typer-Shadow-Pharo' }
ExternalType >> typShaMethodIsAtomic: aLookup [
	<typShaMethod: 'isAtomic'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
