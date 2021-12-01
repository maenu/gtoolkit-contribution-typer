Extension { #name : #Association }

{ #category : #'*Typer-Inference' }
Association >> typInfType [
	| type |
	type := super typInfType.
	^ type
		copyWithParameters:
			{key typInfType.
			value typInfType}
]
