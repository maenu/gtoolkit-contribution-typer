Extension { #name : #GlobalVariable }

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfNode: aNode context: aContext [

	^ TypInfGlobal node: aNode context: aContext
]
