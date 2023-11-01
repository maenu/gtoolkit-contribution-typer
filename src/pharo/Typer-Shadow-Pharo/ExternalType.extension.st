Extension { #name : #ExternalType }

{ #category : #'*Typer-Shadow-Pharo' }
ExternalType >> typShaMethodUnaryIsAtomic: aLookup root: anotherLookup [
	<typShaMethod: 'isAtomic'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
