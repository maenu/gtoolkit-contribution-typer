Extension { #name : #SelfVariable }

{ #category : #'*Typer-Inference' }
SelfVariable >> typInfFlowInitialize: aNode in: aState [

	aState at: aNode put: aState self
]
