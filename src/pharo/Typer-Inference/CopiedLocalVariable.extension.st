Extension { #name : #CopiedLocalVariable }

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfFlowInitialValueIn: aState [

	^ originalVar typInfFlowInitialValueIn: aState
]

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfFlowValue: aNode in: aState [

	^ originalVar typInfFlowValue: aNode in: aState
]
