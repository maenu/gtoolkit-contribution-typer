Extension { #name : #SuperVariable }

{ #category : #'*Typer-Inference' }
SuperVariable >> typInfInitialize: aNode in: aState [

	aState at: aNode put: aState super
]
