Extension { #name : #Association }

{ #category : #'*Typer-Inference' }
Association >> typInfSelfType [
	| type |
	type := super typInfSelfType.
	^ type
		copyWithParameters:
			{key typInfSelfType.
			value typInfSelfType}
]
