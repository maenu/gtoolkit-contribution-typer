Extension { #name : #CopiedLocalVariable }

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfFlowTypeIn: aDictionary [

	^ originalVar typInfFlowTypeIn: aDictionary
]
