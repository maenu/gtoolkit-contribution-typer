Extension { #name : #ClassVariable }

{ #category : #'*Typer-Inference' }
ClassVariable >> typInfFlowTypeIn: aDictionary [

	^ aDictionary
		  at: self
		  put: (owningClass typAsType lookupVariable: name asSymbol)
]
