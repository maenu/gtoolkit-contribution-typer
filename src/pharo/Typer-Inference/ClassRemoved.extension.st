Extension { #name : #ClassRemoved }

{ #category : #'*Typer-Inference' }
ClassRemoved >> typInfInvalidate [
	<typInvalidate: 20>
	TypInfIndex instance
		removeBehavior: classRemoved;
		removeBehavior: classRemoved class
]
