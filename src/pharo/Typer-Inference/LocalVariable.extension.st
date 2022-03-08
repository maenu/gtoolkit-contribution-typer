Extension { #name : #LocalVariable }

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfConstrain: aNode node: anotherNode to: aType [

	aNode constrainLocal: anotherNode to: aType
]

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfConstrain: aNode to: aType [

	aNode constrainLocalTo: aType
]

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfTransfer: aNode [

	aNode transferLocal
]
