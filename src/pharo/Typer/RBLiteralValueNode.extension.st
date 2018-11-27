Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer' }
RBLiteralValueNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary at: self ifAbsentPut: [ value class typAsType ]
]
