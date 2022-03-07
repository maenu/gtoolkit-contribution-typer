Extension { #name : #ClassVariable }

{ #category : #'*Typer-Inference' }
ClassVariable >> typInfTransfer: aNode in: aState [

	| type |
	type := aState at: aNode.
	type isUnknown ifFalse: [ ^ self ].
	aState
		at: aNode
		put: (owningClass typAsType lookupVariable: name asSymbol)
]
