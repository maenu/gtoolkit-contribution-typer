Extension { #name : #RBComment }

{ #category : #'*Typer-Shadow-Pharo' }
RBComment >> typShaMethodUnaryContents: aLookup [
	<typShaMethod: 'contents'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBComment >> typShaMethodUnaryStart: aLookup [
	<typShaMethod: 'start'>
	^ super typShaMethodUnaryStart: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
RBComment >> typShaMethodUnaryStop: aLookup [
	<typShaMethod: 'stop'>
	^ super typShaMethodUnaryStop: aLookup
]
