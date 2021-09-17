Extension { #name : 'CopiedLocalVariable' }

{ #category : '*Typer-Inference' }
CopiedLocalVariable >> typInfTypeRecursiveIn: aNode [

	^ originalVar typInfTypeRecursiveIn: aNode
]
