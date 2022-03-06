Extension { #name : #GlobalVariable }

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfFlowInitialize: aNode in: aState [

	aState at: aNode put: value typInfType
]
