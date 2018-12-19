Extension { #name : #RBCascadeNode }

{ #category : #'*Typer' }
RBCascadeNode >> typTypeRecursive [
	^ (self messages collect: #typType) last
]
