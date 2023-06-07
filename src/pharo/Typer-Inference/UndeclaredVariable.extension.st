Extension { #name : #UndeclaredVariable }

{ #category : #'*Typer-Inference' }
UndeclaredVariable >> typInfNode: aNode context: aContext [

	^ TypInfUndeclared node: aNode context: aContext
]
