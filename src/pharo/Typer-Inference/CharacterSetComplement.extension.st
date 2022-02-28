Extension { #name : #CharacterSetComplement }

{ #category : #'*Typer-Inference' }
CharacterSetComplement >> typInfType [

	^ self class typAsType withParameters: { Character typAsType }
]
