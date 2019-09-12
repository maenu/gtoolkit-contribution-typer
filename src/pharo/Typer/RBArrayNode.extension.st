Extension { #name : #RBArrayNode }

{ #category : #'*Typer' }
RBArrayNode >> typTypeRecursive [
	^ Array typAsType
		asParametricType: {(self statements collect: #typType) typAsType}
]
