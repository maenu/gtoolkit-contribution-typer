Extension { #name : #RBSelfNode }

{ #category : #'*Typer-Inference' }
RBSelfNode >> typTypeRecursive [
	^ self methodNode typReceiverType
]
