Extension { #name : #GlobalVariable }

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfFlowConstrain: aNode to: aType in: aState [

	
]

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfFlowTransfer: aNode in: aState [

	aState at: aNode put: value typAsType
]
