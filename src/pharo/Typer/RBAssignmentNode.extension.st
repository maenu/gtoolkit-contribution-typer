Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer' }
RBAssignmentNode >> typTypeWithDiscovered: aDictionary [
	^ value typTypeWithDiscovered: aDictionary
]
