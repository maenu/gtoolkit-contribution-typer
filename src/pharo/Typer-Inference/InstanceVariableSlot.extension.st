Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-Inference' }
InstanceVariableSlot >> typInfType: aNode in: aContext [

	^ owningClass typAsType lookupVariable: name asSymbol
]
