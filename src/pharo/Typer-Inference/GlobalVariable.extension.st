Extension { #name : #GlobalVariable }

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfFlowConstrain: aNode to: aType [

	^ aNode state at: aNode
]

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfFlowInitialize: aNode in: aState [

	aState at: aNode put: value typInfType
]

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfFlowTransfer: aNode in: aState [

	
]
