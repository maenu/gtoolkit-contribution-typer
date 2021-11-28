Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Inference' }
RBReturnNode >> typInfTypeRecursiveSelf: aType [

	^ value typInfTypeSelf: aType
]
