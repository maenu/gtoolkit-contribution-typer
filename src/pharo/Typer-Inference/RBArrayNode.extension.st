Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Inference' }
RBArrayNode >> typInfTypeRecursive [
	| type |
	type := Array typAsType.
	type
		at: type parameters keys first
		put: (statements collect: #typInfType) typAsType.
	^ type
]
