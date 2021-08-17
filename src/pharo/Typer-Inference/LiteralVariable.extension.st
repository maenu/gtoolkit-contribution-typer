Extension { #name : #LiteralVariable }

{ #category : #'*Typer-Inference' }
LiteralVariable >> typInfSelfType [

	^ (self class typAsParametricTypeWithParameters: { 
			   ('@B' -> Symbol typAsType).
			   ('@A' -> value typInfSelfType) } asOrderedDictionary) copyWithValue:
		  value
]
