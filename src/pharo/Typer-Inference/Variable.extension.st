Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfFlowAddTo: aSet [

	aSet add: self
]

{ #category : #'*Typer-Inference' }
Variable >> typInfFlowTypeIn: aDictionary [

	^ aDictionary at: self
]
