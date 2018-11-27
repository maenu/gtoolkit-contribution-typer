Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer' }
RBAssignmentNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ value typTypeWithDiscovered: aDictionary
]
