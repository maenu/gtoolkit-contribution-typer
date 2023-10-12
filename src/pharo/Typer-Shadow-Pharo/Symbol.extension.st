Extension { #name : #Symbol }

{ #category : #'*Typer-Shadow-Pharo' }
Symbol >> typShaMethodUnaryIsBinary: aLookup [
	<typShaMethod: 'isBinary'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Symbol >> typShaMethodUnaryIsKeyword: aLookup [
	<typShaMethod: 'isKeyword'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Symbol >> typShaMethodUnaryIsUnary: aLookup [
	<typShaMethod: 'isUnary'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
