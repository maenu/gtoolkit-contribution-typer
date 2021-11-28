Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer-Inference' }
RBLiteralValueNode >> typInfTypeRecursiveSelf: aType [

	^ value typInfSelfType
]
