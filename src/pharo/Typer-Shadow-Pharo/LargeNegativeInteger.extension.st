Extension { #name : #LargeNegativeInteger }

{ #category : #'*Typer-Shadow-Pharo' }
LargeNegativeInteger >> typShaMetAbs: aLookup [
	<typShaMethod: 'abs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeNegativeInteger >> typShaMetNegated: aLookup [
	<typShaMethod: 'negated'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
