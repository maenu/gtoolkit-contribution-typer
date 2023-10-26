Extension { #name : #ClassModifiedClassDefinition }

{ #category : #'*Typer-Inference' }
ClassModifiedClassDefinition >> typInfInvalidate [
	<typInvalidate: 20>
	TypInfIndex instance
		removeBehavior: oldClassDefinition;
		removeBehavior: oldClassDefinition class;
		addBehavior: newClassDefinition;
		addBehavior: newClassDefinition class
]
