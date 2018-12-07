Extension { #name : #RBCascadeNode }

{ #category : #'*Typer' }
RBCascadeNode >> typTypeRecursive [
	^ self messages last typType
]
