Extension { #name : #RBComment }

{ #category : #'*Typer-Shadow-Pharo' }
RBComment >> typShaMethodUnaryContents: aLookup [
	<typShaMethod: 'contents'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
