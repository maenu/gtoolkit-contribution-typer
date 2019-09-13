Extension { #name : #Association }

{ #category : #'*Typer' }
Association >> typSelfType [
	^ super typSelfType
		asParametricType:
			{key typSelfType.
			value typSelfType}
]
