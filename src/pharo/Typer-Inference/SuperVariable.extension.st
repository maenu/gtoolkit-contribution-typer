Extension { #name : #SuperVariable }

{ #category : #'*Typer-Inference' }
SuperVariable >> typInfNode: aNode context: aContext [

	^ TypInfSuper node: aNode context: aContext
]
