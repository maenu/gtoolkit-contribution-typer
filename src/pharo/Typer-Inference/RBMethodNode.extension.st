Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfContext [
	^ TypInfContext
		sender: nil
		state: TypInfState new
		node: self
		lookup: self compiledMethod typInfMethodLookup
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfNodeInContext: aContext [
	^ TypInfMethod node: self context: aContext
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfRootNodeInContext: aContext [
	^ self typInfNodeInContext: aContext
]
