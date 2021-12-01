Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfTypeRecursiveIn: aContext [

	^ (Array typAsType copyWithParameters:
		   { (contents collect: [ :e | e typInfTypeIn: aContext ]) typAsType }) 
		  copyWithValue: self value
]
