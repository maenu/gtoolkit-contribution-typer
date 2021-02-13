Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Core' }
RBAssignmentNode >> typSignalsAlways [
	^ self value typSignalsAlways
]

{ #category : #'*Typer-Core' }
RBAssignmentNode >> typTypeRecursive [
	^ self variable typType
]
