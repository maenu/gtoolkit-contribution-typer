Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfTypeRecursive [

	^ (Array typAsType copyWithParameters:
		   { (contents collect: #typInfType) typAsType }) copyWithValue:
		  self value
]
