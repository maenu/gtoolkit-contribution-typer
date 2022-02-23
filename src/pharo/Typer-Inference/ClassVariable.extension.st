Extension { #name : #ClassVariable }

{ #category : #'*Typer-Inference' }
ClassVariable >> typInfFlowTypeIn: aDictionary [

	^ owningClass typAsType lookupVariable: name asSymbol
]
