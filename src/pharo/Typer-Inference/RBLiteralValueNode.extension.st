Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer-Inference' }
RBLiteralValueNode >> typTypeRecursive [
	^ (self value "typCastAs Object") typSelfType
]
