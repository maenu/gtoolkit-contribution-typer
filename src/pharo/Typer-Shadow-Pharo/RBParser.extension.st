Extension { #name : #RBParser }

{ #category : #'*Typer-Shadow-Pharo' }
RBParser class >> typShaMethodKeywordParseFaultyMethod: aLookup [
	<typShaMethod: 'parseFaultyMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBMethodNode typAsType
		arguments: {String typAsType}
]
