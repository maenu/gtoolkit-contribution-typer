Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-Inference' }
InstanceVariableSlot >> typInfTypeRecursiveIn: aNode self: aType [

	^ owningClass typAsType lookupVariable: name asSymbol
]
