Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfTypeRecursive [

	^ variable typInfTypeRecursiveIn: self
]
