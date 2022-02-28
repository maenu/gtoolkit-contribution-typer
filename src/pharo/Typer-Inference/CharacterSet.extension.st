Extension { #name : #CharacterSet }

{ #category : #'*Typer-Inference' }
CharacterSet >> typInfType [

	^ self class typAsType withParameters: { Character typAsType }
]
