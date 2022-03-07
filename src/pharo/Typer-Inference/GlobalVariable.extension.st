Extension { #name : #GlobalVariable }

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfInitialize: aNode in: aState [

	aState at: aNode put: value typInfType
]
