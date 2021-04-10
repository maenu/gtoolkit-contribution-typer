Extension { #name : #RBSuperNode }

{ #category : #'*Typer-Inference' }
RBSuperNode >> typInfTypeRecursive [
	^ TypInfSelf value superType
]
