Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Inference' }
RBArrayNode >> typInfTypeRecursive [

	| type |
	type := Array typAsType.
	type copyWithParameters:
		{ (statements collect: #typInfType) typAsType }.
	^ type
]
