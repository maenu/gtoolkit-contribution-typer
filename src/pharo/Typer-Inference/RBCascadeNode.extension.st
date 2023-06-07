Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Inference' }
RBCascadeNode >> typInfNodeInContext: aContext [
	^ TypInfCascade node: self context: aContext
]
