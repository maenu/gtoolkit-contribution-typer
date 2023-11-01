Extension { #name : #RBParser }

{ #category : #'*Typer-Shadow-Pharo' }
RBParser class >> typShaMethodKeywordParseFaultyMethod: aLookup root: anotherLookup [
	<typShaMethod: 'parseFaultyMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBMethodNode typAsType
		arguments: {String typAsType}
]
