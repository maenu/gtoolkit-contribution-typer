Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfTypeRecursiveIn: aContext [

	^ isByteArray
		  ifTrue: [ ByteArray typAsType ]
		  ifFalse: [ 
			  TypValueType
				  value: self value
				  superType: (Array typAsType withParameters:
						   { (contents collect: [ :e | e typInfTypeIn: aContext ])
							   typAsType }) ]
]
