Extension { #name : #LocalVariable }

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfConstrain: aNode to: aType in: aState [

	super typInfConstrain: aNode to: aType in: aState.
	aNode node isDefinition ifFalse: [ 
		aNode constrain: aNode incomingRead to: aType in: aState ]
]

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfTransfer: aNode in: aState [

	aState at: aNode put: (aNode node isDefinition
			 ifTrue: [ 
			 (aNode outgoingReads collect: [ :e | e state at: e ]) typAsType ]
			 ifFalse: [ aState at: aNode incomingRead ])
]
