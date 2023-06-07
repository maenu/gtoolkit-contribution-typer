Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Inference' }
RBArrayNode >> typInfNodeInContext: aContext [
	^ TypInfArray node: self context: aContext
]
