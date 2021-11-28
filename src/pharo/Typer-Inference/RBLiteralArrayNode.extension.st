Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfTypeRecursiveSelf: aType [

	^ (Array typAsType copyWithParameters:
		   { (contents collect: [ :e | e typInfTypeSelf: aType ]) typAsType }) 
		  copyWithValue: self value
]
