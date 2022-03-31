Extension { #name : #UndeclaredVariable }

{ #category : #'*Typer-Inference' }
UndeclaredVariable >> typInfNode: aNode [

	^ TypInfUndeclared node: aNode
]
