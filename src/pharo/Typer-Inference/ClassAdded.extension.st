Extension { #name : #ClassAdded }

{ #category : #'*Typer-Inference' }
ClassAdded >> typInfInvalidate [
	<typInvalidate: 20>
	TypInfIndex instance
		addBehavior: classAdded;
		addBehavior: classAdded class
]
