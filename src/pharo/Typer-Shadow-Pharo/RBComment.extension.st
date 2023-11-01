Extension { #name : #RBComment }

{ #category : #'*Typer-Shadow-Pharo' }
RBComment >> typShaMethodUnaryContents: aLookup root: anotherLookup [
	<typShaMethod: 'contents'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
