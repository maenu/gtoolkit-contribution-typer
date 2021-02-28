Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Inference' }
RBAssignmentNode >> typInfSignalsAlways [
	^ self value typInfSignalsAlways
]

{ #category : #'*Typer-Inference' }
RBAssignmentNode >> typInfTypeRecursive [
	^ self value typInfType
]
