Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer-Inference' }
RBLiteralValueNode >> typInfTypeRecursiveIn: aContext [

	^ value typInfType
]
