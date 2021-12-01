Extension { #name : #ClassVariable }

{ #category : #'*Typer-Inference' }
ClassVariable >> typInfType: aNode in: aContext [

	^ owningClass typAsType lookupVariable: name asSymbol
]
