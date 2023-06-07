Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfNodeInContext: aContext [
	^ TypInfMessage node: self context: aContext
]
