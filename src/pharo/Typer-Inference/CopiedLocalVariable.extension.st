Extension { #name : #CopiedLocalVariable }

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfConstrain: aNode to: aType in: aState [

	super typInfConstrain: aNode to: aType in: aState.
	originalVar typInfConstrain: aNode to: aType in: aState
]

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfInitialize: aNode in: aState [

	super typInfInitialize: aNode in: aState.
	originalVar typInfInitialize: aNode in: aState
]

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfTransfer: aNode in: aState [

	super typInfTransfer: aNode in: aState.
	originalVar typInfTransfer: aNode in: aState
]
