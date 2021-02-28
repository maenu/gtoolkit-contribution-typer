Extension { #name : #RBSuperNode }

{ #category : #'*Typer-Inference' }
RBSuperNode >> typInfTypeRecursive [
	^ self methodNode typInfReceiver superType
]
