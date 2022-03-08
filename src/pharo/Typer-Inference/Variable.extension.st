Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignmentNodes [

	^ (TypInfMethodIndex instance writers: self) flatCollect: [ :m | 
		  m variableNodes
			  select: [ :n | n variable == self and: [ n isWrite ] ]
			  thenCollect: #parent ]
]

{ #category : #'*Typer-Inference' }
Variable >> typInfNode: aNode [

	Halt once.
	^ TypInfVariable node: aNode
]
