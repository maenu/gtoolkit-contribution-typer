Extension { #name : #MetaclassForTraits }

{ #category : #'*Typer-Core' }
MetaclassForTraits >> typAsNamedType [

	^ TypNamedType classDescription: self super: nil
]
