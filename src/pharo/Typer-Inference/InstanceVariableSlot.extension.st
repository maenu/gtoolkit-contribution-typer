Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-Inference' }
InstanceVariableSlot >> typInfFlowValue: aNode in: aState [

	^ owningClass typAsType lookupVariable: name asSymbol
]
