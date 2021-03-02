Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfTypeRecursive [
	| type |
	type := Array typAsType.
	type
		at: type parameters keys first
		put: (self contents collect: #typInfType) typAsType.
	^ type
]
