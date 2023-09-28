Extension { #name : #ClassRemoved }

{ #category : #'*Typer-Inference' }
ClassRemoved >> typInfInvalidateIndex [
	TypInfIndex instance
		removeBehavior: classRemoved;
		removeBehavior: classRemoved class
]
