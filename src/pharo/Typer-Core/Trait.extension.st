Extension { #name : #Trait }

{ #category : #'*Typer-Core' }
Trait >> typAsNamedType [

	^ (TypNamedType classDescription: self)
		  initializeSuperType: TypUnknownType instance;
		  yourself
]
