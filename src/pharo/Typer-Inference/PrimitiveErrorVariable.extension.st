Extension { #name : #PrimitiveErrorVariable }

{ #category : #'*Typer-Inference' }
PrimitiveErrorVariable >> typInfTypeRecursiveIn: aNode [

	^ aNode typInfUnknown
]
