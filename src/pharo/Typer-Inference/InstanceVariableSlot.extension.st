Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-Inference' }
InstanceVariableSlot >> typInfFlowTransfer: aNode in: aState [

	| type |
	type := aState at: aNode.
	type isUnknown ifFalse: [ ^ type ].
	aState
		at: aNode
		put: (owningClass typAsType lookupVariable: name asSymbol)
]
