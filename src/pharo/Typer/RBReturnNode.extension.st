Extension { #name : #RBReturnNode }

{ #category : #'*Typer' }
RBReturnNode >> typTypeRecursive [
	^ self value typType
]
