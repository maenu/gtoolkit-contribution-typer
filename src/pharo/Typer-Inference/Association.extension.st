Extension { #name : #Association }

{ #category : #'*Typer-Inference' }
Association >> typSelfType [
	| type |
	type := super typSelfType.
	^ type
		copyWithParameters:
			{((type parameters keys at: 1) -> key typSelfType).
			((type parameters keys at: 2) -> value typSelfType)}
				asOrderedDictionary
]
