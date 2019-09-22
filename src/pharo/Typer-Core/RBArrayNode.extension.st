Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Core' }
RBArrayNode >> typTypeRecursive [
	^ Array typAsType
		asParametricType: {(self statements collect: #typType) typAsType}
]
