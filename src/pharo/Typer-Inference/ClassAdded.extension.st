Extension { #name : #ClassAdded }

{ #category : #'*Typer-Inference' }
ClassAdded >> typInfInvalidateIndex [
	TypInfIndex instance
		addBehavior: classAdded;
		addBehavior: classAdded class
]
