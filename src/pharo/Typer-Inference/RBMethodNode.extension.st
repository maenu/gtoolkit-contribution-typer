Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfContextLookup [
	^ TypInfContextLookup
		node: self
		arguments: selector value typInfUnknownArguments
		self: self methodClass typAsType
		super: self methodClass typAsType superOrNil
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfNodeInContext: aContext [
	^ TypInfMethod node: self context: aContext
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfRootNodeInContext: aContext [
	^ self typInfNodeInContext: aContext
]
