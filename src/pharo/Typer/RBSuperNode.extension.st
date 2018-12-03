Extension { #name : #RBSuperNode }

{ #category : #'*Typer' }
RBSuperNode >> typTypeRecursive [
	^ self methodNode method methodClass superclass typAsType
]
