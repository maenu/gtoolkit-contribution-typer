Extension { #name : 'RBLiteralValueNode' }

{ #category : '*Typer-Inference' }
RBLiteralValueNode >> typInfTypeRecursive [
	^ value typInfSelfType
]
