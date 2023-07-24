Extension { #name : #RBComment }

{ #category : #'*Typer-Shadow-Pharo' }
RBComment >> typShaMethodContents: aLookup [
	<typShaMethod: 'contents'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBComment >> typShaMethodStart: aLookup [
	<typShaMethod: 'start'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBComment >> typShaMethodStop: aLookup [
	<typShaMethod: 'stop'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]
