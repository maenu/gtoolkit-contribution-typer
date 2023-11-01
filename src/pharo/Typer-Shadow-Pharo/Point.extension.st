Extension { #name : #Point }

{ #category : #'*Typer-Shadow-Pharo' }
Point >> typShaMethodUnaryAbs: aLookup root: anotherLookup [
	<typShaMethod: 'abs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
