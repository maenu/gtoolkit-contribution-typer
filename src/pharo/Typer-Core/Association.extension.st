Extension { #name : #Association }

{ #category : #'*Typer-Core' }
Association >> typSelfType [
	^ super typSelfType
		asParametricType:
			{key typSelfType.
			value typSelfType}
]
