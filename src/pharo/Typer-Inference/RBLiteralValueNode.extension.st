Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer-Inference' }
RBLiteralValueNode >> typInfNodeInContext: aContext [
	^ TypInfLiteralValue node: self context: aContext
]
