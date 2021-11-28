Extension { #name : #CopiedLocalVariable }

{ #category : #'*Typer-Inference' }
CopiedLocalVariable >> typInfTypeRecursiveIn: aNode self: aType [

	^ originalVar typInfTypeRecursiveIn: aNode self: aType
]
