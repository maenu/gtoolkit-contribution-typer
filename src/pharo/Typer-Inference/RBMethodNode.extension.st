Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfContextFor: aLookup [
	^ TypInfContext
		sender: nil
		state: TypInfState new
		node: self
		lookup: aLookup
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfNodeInContext: aContext [
	^ TypInfMethod node: self context: aContext
]
