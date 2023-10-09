Extension { #name : #LargePositiveInteger }

{ #category : #'*Typer-Shadow-Pharo' }
LargePositiveInteger >> typShaMetAbs: aLookup [
	<typShaMethod: 'abs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
LargePositiveInteger >> typShaMetNegated: aLookup [
	<typShaMethod: 'negated'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
