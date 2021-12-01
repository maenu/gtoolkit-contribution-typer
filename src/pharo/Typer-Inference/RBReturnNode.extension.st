Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Inference' }
RBReturnNode >> typInfTypeRecursiveIn: aContext [

	^ value typInfTypeIn: aContext
]
