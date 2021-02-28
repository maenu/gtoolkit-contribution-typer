Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer-Inference' }
RBLiteralValueNode >> typInfTypeRecursive [
	^ (self value "typCastAs Object") typInfSelfType
]
