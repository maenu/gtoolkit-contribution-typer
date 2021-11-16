Extension { #name : 'RBReturnNode' }

{ #category : '*Typer-Inference' }
RBReturnNode >> typInfTypeRecursive [
	^ value typInfType
]
