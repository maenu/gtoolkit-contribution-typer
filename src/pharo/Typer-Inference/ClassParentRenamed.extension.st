Extension { #name : #ClassParentRenamed }

{ #category : #'*Typer-Inference' }
ClassParentRenamed >> typInfInvalidateIndex [
	TypInfIndex instance
		removeBehavior: classAffected;
		removeBehavior: classAffected class;
		addBehavior: classAffected;
		addBehavior: classAffected class
]
