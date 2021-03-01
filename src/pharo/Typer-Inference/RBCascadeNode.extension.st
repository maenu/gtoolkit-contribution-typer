Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Inference' }
RBCascadeNode >> typInfTypeRecursive [
	^ (self messages collect: #typInfType) last
]
