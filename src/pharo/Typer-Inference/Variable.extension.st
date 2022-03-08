Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignmentNodes [

	^ (TypInfMethodIndex instance writers: self) flatCollect: [ :m | 
		  m variableNodes
			  select: [ :n | n variable == self and: [ n isWrite ] ]
			  thenCollect: #parent ]
]

{ #category : #'*Typer-Inference' }
Variable >> typInfConstrain: aNode node: anotherNode to: aType [

	aNode constrainVariable: anotherNode to: aType
]

{ #category : #'*Typer-Inference' }
Variable >> typInfConstrain: aNode to: aType [

	aNode constrainVariableTo: aType
]

{ #category : #'*Typer-Inference' }
Variable >> typInfInitialize: aNode [

	aNode initializeVariable
]

{ #category : #'*Typer-Inference' }
Variable >> typInfTransfer: aNode [

	
]
