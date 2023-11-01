Extension { #name : #Symbol }

{ #category : #'*Typer-Shadow-Pharo' }
Symbol >> typShaMethodUnaryIsBinary: aLookup root: anotherLookup [
	<typShaMethod: 'isBinary'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Symbol >> typShaMethodUnaryIsKeyword: aLookup root: anotherLookup [
	<typShaMethod: 'isKeyword'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Symbol >> typShaMethodUnaryIsUnary: aLookup root: anotherLookup [
	<typShaMethod: 'isUnary'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
