Extension { #name : #RBSelfNode }

{ #category : #'*Typer-Inference' }
RBSelfNode >> typInfTypeRecursive [
	^ self methodNode typInfReceiver
]
