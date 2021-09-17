Extension { #name : 'RBCascadeNode' }

{ #category : '*Typer-Inference' }
RBCascadeNode >> typInfTypeRecursive [
	^ (messages collect: #typInfType) last
]
