Extension { #name : #GlobalVariable }

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfType: aNode in: aContext [

	^ value typInfType
]
