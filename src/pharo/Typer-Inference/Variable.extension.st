Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfAssignedTypeIn: aContext [

	^ (self assignmentNodes collect: [ :f | f typInfTypeIn: aContext ])
		  typAsType
]

{ #category : #'*Typer-Inference' }
Variable >> typInfType: aNode in: aContext [

	^ aContext unknown: aNode
]
