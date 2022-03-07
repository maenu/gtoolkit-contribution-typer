Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-Inference' }
InstanceVariableSlot >> typInfTransfer: aNode in: aState [

	| type |
	type := aState at: aNode.
	type isUnknown ifFalse: [ ^ self ].
	aState
		at: aNode
		put: (owningClass typAsType lookupVariable: name asSymbol)
]
