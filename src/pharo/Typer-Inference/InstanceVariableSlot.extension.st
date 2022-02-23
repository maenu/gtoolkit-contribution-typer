Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-Inference' }
InstanceVariableSlot >> typInfFlowTypeIn: aDictionary [

	^ owningClass typAsType lookupVariable: name asSymbol
]
