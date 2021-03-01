Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Inference' }
RBReturnNode >> typInfTypeRecursive [
	^ self value typInfType
]
