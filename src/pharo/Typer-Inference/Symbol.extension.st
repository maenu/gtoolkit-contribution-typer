Extension { #name : #Symbol }

{ #category : #'*Typer-Inference' }
Symbol >> typInfType [

	^ TypValueType super: self class typAsType value: self
]
