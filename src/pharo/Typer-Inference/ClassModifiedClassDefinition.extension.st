Extension { #name : #ClassModifiedClassDefinition }

{ #category : #'*Typer-Inference' }
ClassModifiedClassDefinition >> typInfInvalidateIndex [
	TypInfIndex instance
		removeBehavior: oldClassDefinition;
		removeBehavior: oldClassDefinition class;
		addBehavior: newClassDefinition;
		addBehavior: newClassDefinition class
]
