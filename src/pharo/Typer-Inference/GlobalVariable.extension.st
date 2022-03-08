Extension { #name : #GlobalVariable }

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfNode: aNode [

	^ TypInfGlobal node: aNode
]
