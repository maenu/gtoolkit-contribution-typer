Extension { #name : #Point }

{ #category : #'*Typer-Shadow-Pharo' }
Point >> typShaMethodAbs: aLookup [
	<typShaMethod: 'abs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
