Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfNodeInContext: aContext [
	^ TypInfLiteralArray node: self context: aContext
]
