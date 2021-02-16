Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Inference' }
RBAssignmentNode >> typSignalsAlways [
	^ self value typSignalsAlways
]

{ #category : #'*Typer-Inference' }
RBAssignmentNode >> typTypeRecursive [
	^ self variable typType
]
