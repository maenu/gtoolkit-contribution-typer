Extension { #name : #SelfVariable }

{ #category : #'*Typer-Inference' }
SelfVariable >> typInfNode: aNode context: aContext [

	^ TypInfSelf node: aNode context: aContext
]
