Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer' }
RBAssignmentNode >> typSignalsAlways [
	^ self value typSignalsAlways
]

{ #category : #'*Typer' }
RBAssignmentNode >> typTypeRecursive [
	^ self variable typType
]
