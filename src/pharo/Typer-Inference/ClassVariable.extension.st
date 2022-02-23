Extension { #name : #ClassVariable }

{ #category : #'*Typer-Inference' }
ClassVariable >> typInfFlowValue: aNode in: aState [

	^ owningClass typAsType lookupVariable: name asSymbol
]
