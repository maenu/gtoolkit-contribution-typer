Extension { #name : #TemporaryVariable }

{ #category : #'*Typer-Inference' }
TemporaryVariable >> typInfFlowValue: aNode in: aState [

	^ aState at: aNode
]
