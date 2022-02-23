Extension { #name : #GlobalVariable }

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfFlowValue: aNode in: aState [

	^ value typAsType
]
