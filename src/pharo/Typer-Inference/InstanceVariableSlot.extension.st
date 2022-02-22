Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-Inference' }
InstanceVariableSlot >> typInfFlowTypeIn: aDictionary [

	^ aDictionary
		  at: self
		  put: (owningClass typAsType lookupVariable: name asSymbol)
]
