Extension { #name : #RBParser }

{ #category : #'*Typer-Shadow-Pharo' }
RBParser class >> typShaMethodParseFaultyMethod: aLookup [
	<typShaMethod: 'parseFaultyMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBMethodNode typAsType
		arguments: {String typAsType}
]
