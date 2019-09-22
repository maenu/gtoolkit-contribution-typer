Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer-Core' }
RBLiteralValueNode >> typTypeRecursive [
	^ (self value "typCastAs Object") typSelfType
]
