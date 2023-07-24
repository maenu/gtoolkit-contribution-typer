Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBLiteralArrayNode >> typShaMethodContents: aLookup [
	<typShaMethod: 'contents'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBLiteralNode typAsType})
]
