Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfTypeRecursiveIn: aContext [

	^ variable typInfType: self in: aContext
]
