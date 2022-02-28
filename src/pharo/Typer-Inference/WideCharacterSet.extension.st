Extension { #name : #WideCharacterSet }

{ #category : #'*Typer-Inference' }
WideCharacterSet >> typInfType [

	^ self class typAsType withParameters: { Character typAsType }
]
