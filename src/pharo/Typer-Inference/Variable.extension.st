Extension { #name : #Variable }

{ #category : #'*Typer-Inference' }
Variable >> typInfTypeRecursiveIn: aNode self: aType [

	^ aNode typInfUnknownSelf: aType
]
