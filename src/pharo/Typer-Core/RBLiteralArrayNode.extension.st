Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Core' }
RBLiteralArrayNode >> typTypeRecursive [
	^ Array typAsType
		asParametricType: {(self contents collect: #typType) typAsType}
]
