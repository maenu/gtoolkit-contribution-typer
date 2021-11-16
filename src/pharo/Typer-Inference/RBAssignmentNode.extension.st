Extension { #name : 'RBAssignmentNode' }

{ #category : '*Typer-Inference' }
RBAssignmentNode >> typInfTypeRecursive [
	^ value typInfType
]
