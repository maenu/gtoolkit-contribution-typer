Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypeRecursive [
	^ Array typAsType
		asParametricType: {(self contents collect: #typType) typAsType}
]
