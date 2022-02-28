Extension { #name : #Symbol }

{ #category : #'*Typer-Inference' }
Symbol >> typInfType [

	^ TypValueType value: self superType: self class typAsType
]
