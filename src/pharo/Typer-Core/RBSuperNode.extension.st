Extension { #name : #RBSuperNode }

{ #category : #'*Typer-Core' }
RBSuperNode >> typTypeRecursive [
	^ self methodNode typReceiverType superType
]
