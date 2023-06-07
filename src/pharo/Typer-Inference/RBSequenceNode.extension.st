Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typInfNodeInContext: aContext [
	^ TypInfSequence node: self context: aContext
]
