Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer' }
RBLiteralValueNode >> typTypeRecursive [
	^ (self value "typCastAs Object") class typAsType
]
