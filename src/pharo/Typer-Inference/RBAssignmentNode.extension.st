Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Inference' }
RBAssignmentNode >> typInfTypeRecursiveSelf: aType [

	^ value typInfTypeSelf: aType
]
