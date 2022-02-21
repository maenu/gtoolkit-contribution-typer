Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Inference' }
RBAssignmentNode >> typInfFlow [

	^ TypInfFlowAssign node: self
]
