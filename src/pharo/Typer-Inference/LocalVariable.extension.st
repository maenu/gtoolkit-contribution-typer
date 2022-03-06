Extension { #name : #LocalVariable }

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfFlowConstrain: aNode to: aType [

	aNode
		readIfPresent: [ :e | aNode constrain: e to: aType ]
		ifAbsent: [ "noop" ]
]

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfFlowTransfer: aNode in: aState [

	aNode node isDefinition ifTrue: [ 
		aState
			at: aNode
			put: (aNode outgoingReads collect: [ :e | aState at: e ]) typAsType ]
]
