Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Inference' }
RBReturnNode >> typInfNodeInContext: aContext [
	^ TypInfReturn node: self context: aContext
]
