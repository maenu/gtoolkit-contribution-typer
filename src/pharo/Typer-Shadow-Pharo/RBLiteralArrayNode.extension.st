Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBLiteralArrayNode >> typShaMethodUnaryContents: aLookup root: anotherLookup [
	<typShaMethod: 'contents'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBLiteralNode typAsType})
]
