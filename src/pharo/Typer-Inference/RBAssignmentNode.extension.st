Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Inference' }
RBAssignmentNode >> typInfNodeInContext: aContext [
	^ TypInfAssignment node: self context: aContext
]
