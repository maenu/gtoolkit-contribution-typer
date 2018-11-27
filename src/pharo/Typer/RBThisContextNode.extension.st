Extension { #name : #RBThisContextNode }

{ #category : #'*Typer' }
RBThisContextNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary at: self ifAbsentPut: [ Context typAsType ]
]
