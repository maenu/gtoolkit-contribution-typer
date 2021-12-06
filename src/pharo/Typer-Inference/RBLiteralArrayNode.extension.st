Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfTypeRecursiveIn: aContext [

	^ ((isByteArray
		    ifTrue: [ ByteArray ]
		    ifFalse: [ Array ]) typAsType copyWithParameters:
		   { (contents collect: [ :e | e typInfTypeIn: aContext ]) typAsType }) 
		  copyWithValue: self value
]
