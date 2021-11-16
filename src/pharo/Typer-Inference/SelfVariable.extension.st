Extension { #name : 'SelfVariable' }

{ #category : '*Typer-Inference' }
SelfVariable >> typInfTypeRecursiveIn: aNode [

	^ TypInfSelf value
]
