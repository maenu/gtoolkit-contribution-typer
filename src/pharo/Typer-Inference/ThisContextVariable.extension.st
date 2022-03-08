Extension { #name : #ThisContextVariable }

{ #category : #'*Typer-Inference' }
ThisContextVariable >> typInfNode: aNode [

	^ TypInfThisContext node: aNode
]
