Extension { #name : #SuperVariable }

{ #category : #'*Typer-Inference' }
SuperVariable >> typInfFlowInitialize: aNode in: aState [

	aState at: aNode put: aState super
]
