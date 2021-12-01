Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Inference' }
RBArrayNode >> typInfTypeRecursiveIn: aContext [

	^ Array typAsType copyWithParameters:
		  { (statements collect: [ :e | e typInfTypeIn: aContext ])
			  typAsType }
]
