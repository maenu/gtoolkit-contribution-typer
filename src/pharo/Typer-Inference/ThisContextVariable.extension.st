Extension { #name : #ThisContextVariable }

{ #category : #'*Typer-Inference' }
ThisContextVariable >> typInfInitialize: aNode in: aState [

	aState at: aNode put: Context typAsType
]
