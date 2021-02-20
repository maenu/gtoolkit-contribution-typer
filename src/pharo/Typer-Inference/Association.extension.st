Extension { #name : #Association }

{ #category : #'*Typer-Inference' }
Association >> typSelfType [
	| type |
	type := super typSelfType.
	^ type
		copyWithParameters:
			{key typSelfType.
			value typSelfType}
]
