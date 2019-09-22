Extension { #name : #RBSuperNode }

{ #category : #'*Typer-Core' }
RBSuperNode >> typTypeRecursive [
	^ self methodNode method methodClass superclass typAsType
]
