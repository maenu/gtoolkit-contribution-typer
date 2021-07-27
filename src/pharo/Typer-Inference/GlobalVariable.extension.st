Extension { #name : #GlobalVariable }

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfTypeRecursiveIn: aNode [

	^ value typInfSelfType
]
