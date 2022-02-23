Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfFlowInitialValueIn: aState [

	^ TypUnknownType instance
]

{ #category : #'*Typer-Inference' }
Variable >> typInfFlowValue: aNode in: aState [

	^ TypUnknownType instance
]
