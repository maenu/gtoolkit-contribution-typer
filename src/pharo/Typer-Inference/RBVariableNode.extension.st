Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfNodeInContext: aContext [
	^ variable typInfNode: self context: aContext
]
