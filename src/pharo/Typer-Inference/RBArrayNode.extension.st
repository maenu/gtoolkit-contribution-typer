Extension { #name : 'RBArrayNode' }

{ #category : '*Typer-Inference' }
RBArrayNode >> typInfTypeRecursive [

	^ Array typAsType copyWithParameters:
		  { (statements collect: #typInfType) typAsType }
]
