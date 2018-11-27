Extension { #name : #RBSuperNode }

{ #category : #'*Typer' }
RBSuperNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary at: self ifAbsentPut: [ self methodNode method methodClass superclass typAsType ]
]
