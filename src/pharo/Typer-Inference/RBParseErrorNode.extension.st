Extension { #name : #RBParseErrorNode }

{ #category : #'*Typer-Inference' }
RBParseErrorNode >> typInfNodeInContext: aContext [
	^ TypInfError node: self context: aContext
]
