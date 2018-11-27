Extension { #name : #RBSelfNode }

{ #category : #'*Typer' }
RBSelfNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary at: self ifAbsentPut: [ self methodNode method methodClass typAsType ]
]
