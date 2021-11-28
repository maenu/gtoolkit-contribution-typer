Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfTypeRecursiveSelf: aType [

	^ variable typInfTypeRecursiveIn: self self: aType
]
