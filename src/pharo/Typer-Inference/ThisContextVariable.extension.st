Extension { #name : #ThisContextVariable }

{ #category : #'*Typer-Inference' }
ThisContextVariable >> typInfTypeRecursiveIn: aNode self: aType [

	^ Context typAsType
]
