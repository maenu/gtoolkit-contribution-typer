Extension { #name : #CopiedLocalVariable }

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfConstrain: aNode node: anotherNode to: aType [

	originalVar typInfConstrain: aNode node: anotherNode to: aType
]

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfInitialize: aNode [

	originalVar typInfInitialize: aNode
]

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfTransfer: aNode [

	originalVar typInfTransfer: aNode
]
