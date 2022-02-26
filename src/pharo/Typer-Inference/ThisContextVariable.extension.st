Extension { #name : #ThisContextVariable }

{ #category : #'*Typer-Inference' }
ThisContextVariable >> typInfFlowInitialize: aNode in: aState [

	aState at: aNode put: Context typAsType
]
