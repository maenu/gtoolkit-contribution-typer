Extension { #name : #RBCascadeNode }

{ #category : #'*Typer' }
RBCascadeNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ messages last typTypeWithDiscovered: aDictionary
]
