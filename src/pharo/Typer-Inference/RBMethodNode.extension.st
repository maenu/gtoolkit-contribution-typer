Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfNodeInContext: aContext [
	^ TypInfMethod node: self context: aContext
]
