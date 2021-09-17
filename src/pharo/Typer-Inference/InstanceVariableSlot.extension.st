Extension { #name : 'InstanceVariableSlot' }

{ #category : '*Typer-Inference' }
InstanceVariableSlot >> typInfTypeRecursiveIn: aNode [

	^ owningClass typAsType lookupVariable: name asSymbol
]
