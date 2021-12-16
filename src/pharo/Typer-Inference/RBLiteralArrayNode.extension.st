Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfTypeRecursiveIn: aContext [

	^ isByteArray
		  ifTrue: [ ByteArray typAsType ]
		  ifFalse: [ 
			  (Array typAsType copyWithParameters:
					   { (contents collect: [ :e | e typInfTypeIn: aContext ])
						   typAsType })
				  initializeValue: self value;
				  "copying once is enough, initializers instead of copiers"
					  yourself ]
]
