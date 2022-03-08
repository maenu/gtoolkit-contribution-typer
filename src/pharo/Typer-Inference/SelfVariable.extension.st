Extension { #name : #SelfVariable }

{ #category : #'*Typer-Inference' }
SelfVariable >> typInfNode: aNode [

	^ TypInfSelf node: aNode
]
