Extension { #name : #RBSuperNode }

{ #category : #'*Typer' }
RBSuperNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ self methodNode method methodClass superclass typAsType
]
