Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Inference' }
RBArrayNode >> typInfTypeRecursiveIn: aContext [

	^ Array typAsType withParameters:
		  { (statements collect: [ :e | e typInfTypeIn: aContext ])
			  typAsType }
]
