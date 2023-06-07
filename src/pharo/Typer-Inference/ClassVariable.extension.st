Extension { #name : #ClassVariable }

{ #category : #'*Typer-Inference' }
ClassVariable >> typInfNode: aNode context: aContext [

	^ TypInfClass node: aNode context: aContext
]
