Extension { #name : #MetaclassForTraits }

{ #category : #'*Typer-Core' }
MetaclassForTraits >> typAsNamedType [

	^ (TypNamedType classDescription: self)
		  initializeSuperType: TypUnknownType instance;
		  yourself
]
