Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBLiteralArrayNode >> typShaMethodUnaryContents: aLookup [
	<typShaMethod: 'contents'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBLiteralNode typAsType})
]
