Extension { #name : #ThisContextVariable }

{ #category : #'*Typer-Inference' }
ThisContextVariable >> typInfNode: aNode context: aContext [

	^ TypInfThisContext node: aNode context: aContext
]
