Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Inference' }
RBAssignmentNode >> typInfTypeRecursiveIn: aContext [

	^ value typInfTypeIn: aContext
]
