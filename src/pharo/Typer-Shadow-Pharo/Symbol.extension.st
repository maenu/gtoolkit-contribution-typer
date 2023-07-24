Extension { #name : #Symbol }

{ #category : #'*Typer-Shadow-Pharo' }
Symbol >> typShaMethodIsBinary: aLookup [
	<typShaMethod: 'isBinary'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Symbol >> typShaMethodIsKeyword: aLookup [
	<typShaMethod: 'isKeyword'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Symbol >> typShaMethodIsUnary: aLookup [
	<typShaMethod: 'isUnary'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
