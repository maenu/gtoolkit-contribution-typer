Extension { #name : #SelfVariable }

{ #category : #'*Typer-Inference' }
SelfVariable >> typInfInitialize: aNode in: aState [

	aState at: aNode put: aState self
]
