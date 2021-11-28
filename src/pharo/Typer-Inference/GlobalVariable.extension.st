Extension { #name : #GlobalVariable }

{ #category : #'*Typer-Inference' }
GlobalVariable >> typInfTypeRecursiveIn: aNode self: aType [

	^ value typInfSelfType
]
