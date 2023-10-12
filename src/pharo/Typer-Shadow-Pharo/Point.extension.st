Extension { #name : #Point }

{ #category : #'*Typer-Shadow-Pharo' }
Point >> typShaMethodUnaryAbs: aLookup [
	<typShaMethod: 'abs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
