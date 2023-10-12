Extension { #name : #ExternalType }

{ #category : #'*Typer-Shadow-Pharo' }
ExternalType >> typShaMethodUnaryIsAtomic: aLookup [
	<typShaMethod: 'isAtomic'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
