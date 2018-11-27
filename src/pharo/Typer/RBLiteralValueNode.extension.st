Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer' }
RBLiteralValueNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ value class typAsType
]
