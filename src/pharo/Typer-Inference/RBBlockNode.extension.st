Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Inference' }
RBBlockNode >> typInfNodeInContext: aContext [
	^ TypInfBlock node: self context: aContext
]
