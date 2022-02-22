Extension { #name : #CopiedLocalVariable }

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfFlowAddTo: aSet [

	originalVar typInfFlowAddTo: aSet
]

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfFlowTypeIn: aDictionary [

	^ originalVar typInfFlowTypeIn: aDictionary
]
