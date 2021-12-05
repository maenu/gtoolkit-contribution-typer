Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfTypeRecursiveIn: aContext [

	self flag: 'TODO handle bytearray properly'.

	^ (Array typAsType copyWithParameters:
		   { (contents collect: [ :e | e typInfTypeIn: aContext ]) typAsType }) 
		  copyWithValue: self value
]
