Extension { #name : #ClassParentRenamed }

{ #category : #'*Typer-Inference' }
ClassParentRenamed >> typInfInvalidate [
	<typInvalidate: 20>
	TypInfIndex instance
		removeBehavior: classAffected;
		removeBehavior: classAffected class;
		addBehavior: classAffected;
		addBehavior: classAffected class
]
