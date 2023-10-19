Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfContextSelf: aType super: anotherTypeOrNil [
	^ TypInfContext
		sender: nil
		state: TypInfState new
		node: self
		self: aType
		super: anotherTypeOrNil
]

{ #category : #'*Typer-Inference' }
RBMethodNode >> typInfNodeInContext: aContext [
	^ TypInfMethod node: self context: aContext
]
