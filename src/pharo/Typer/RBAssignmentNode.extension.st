Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer' }
RBAssignmentNode >> typTypeRecursive [
	^ self value typType
]
