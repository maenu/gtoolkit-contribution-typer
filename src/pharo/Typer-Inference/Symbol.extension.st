Extension { #name : #Symbol }

{ #category : #'*Typer-Inference' }
Symbol >> typInfType [

	^ TypValueType value: self super: self class typAsType
]
