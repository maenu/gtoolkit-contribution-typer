Extension { #name : #SelfVariable }

{ #category : #'*Typer-Inference' }
SelfVariable >> typInfType: aNode in: aContext [

	^ aContext self
]
