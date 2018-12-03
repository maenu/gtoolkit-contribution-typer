Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer' }
RBAssignmentNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ value typType
]
