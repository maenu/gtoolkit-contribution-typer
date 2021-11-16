Extension { #name : #ClassVariable }

{ #category : #'*Typer-Inference' }
ClassVariable >> typInfTypeRecursiveIn: aNode [

	^ owningClass typAsType lookupVariable: name asSymbol
]
