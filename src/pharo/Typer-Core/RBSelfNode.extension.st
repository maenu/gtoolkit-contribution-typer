Extension { #name : #RBSelfNode }

{ #category : #'*Typer-Core' }
RBSelfNode >> typTypeRecursive [
	^ self methodNode typReceiverType
]
