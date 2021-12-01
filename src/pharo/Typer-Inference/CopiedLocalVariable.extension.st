Extension { #name : #CopiedLocalVariable }

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfType: aNode in: aContext [

	^ originalVar typInfType: aNode in: aContext
]
