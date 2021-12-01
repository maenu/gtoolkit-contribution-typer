Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfType: aNode in: aContext [

	^ aContext unknown: aNode
]
