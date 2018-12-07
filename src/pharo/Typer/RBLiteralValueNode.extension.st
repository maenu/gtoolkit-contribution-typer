Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer' }
RBLiteralValueNode >> typTypeRecursive [
	^ self value class typAsType
]
