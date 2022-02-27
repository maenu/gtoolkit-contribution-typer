Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Inference' }
RBAssignmentNode >> typInfFlow [

	^ TypInfAssignment node: self
]
