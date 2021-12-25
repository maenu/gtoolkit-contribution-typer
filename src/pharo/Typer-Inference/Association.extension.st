Extension { #name : #Association }

{ #category : #'*Typer-Inference' }
Association >> typInfType [
	| type |
	type := super typInfType.
	^ type
		withParameters:
			{key typInfType.
			value typInfType}
]
