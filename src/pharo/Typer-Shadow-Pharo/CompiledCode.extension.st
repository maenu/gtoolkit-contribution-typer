Extension { #name : #CompiledCode }

{ #category : #'*Typer-Shadow-Pharo' }
CompiledCode >> typShaMethodIsPrimitive: aLookup [
	<typShaMethod: 'isPrimitive'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
