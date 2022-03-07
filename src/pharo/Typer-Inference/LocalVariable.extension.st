Extension { #name : #LocalVariable }

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfFlowConstrain: aNode to: aType in: aState [

	^ aNode node isDefinition
		  ifTrue: [ aNode constrain: aNode to: aType in: aState ]
		  ifFalse: [ aNode constrain: aNode incomingRead to: aType in: aState ]
]

{ #category : #'*Typer-Inference' }
LocalVariable >> typInfFlowTransfer: aNode in: aState [

	aNode node isDefinition
		ifTrue: [ 
			aState
				at: aNode
				put:
				(aNode outgoingReads collect: [ :e | e state at: e ])
					typAsType ]
		ifFalse: [ aState at: aNode put: (aState at: aNode incomingRead) ]
]
