Extension { #name : #CopiedLocalVariable }

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfFlowConstrain: aNode to: aType in: aState [

	^ originalVar typInfFlowConstrain: aNode to: aType in: aState
]

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfFlowInitialize: aNode in: aState [

	originalVar typInfFlowInitialize: aNode in: aState
]

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfFlowTransfer: aNode in: aState [

	originalVar typInfFlowTransfer: aNode in: aState
]
