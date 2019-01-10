Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer' }
RBAssignmentNode >> typIsSignal [
	^ self value typIsSignal
]

{ #category : #'*Typer' }
RBAssignmentNode >> typTypeRecursive [
	^ self variable typType
]
