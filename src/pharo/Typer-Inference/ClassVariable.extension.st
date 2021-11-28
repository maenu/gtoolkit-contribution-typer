Extension { #name : #ClassVariable }

{ #category : #'*Typer-Inference' }
ClassVariable >> typInfTypeRecursiveIn: aNode self: aType [

	^ owningClass typAsType lookupVariable: name asSymbol
]
