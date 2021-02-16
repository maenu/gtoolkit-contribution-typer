Extension { #name : #RBSuperNode }

{ #category : #'*Typer-Inference' }
RBSuperNode >> typTypeRecursive [
	^ self methodNode typReceiverType superType
]
