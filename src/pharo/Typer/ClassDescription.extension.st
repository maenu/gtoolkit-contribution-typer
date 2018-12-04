Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typAsNamedType [
	<typTypeResultAs: 'TypNamedType'>
	^ TypNamedType new
		name: self name asSymbol;
		yourself
]

{ #category : #'*Typer' }
ClassDescription >> typAsType [
	<typTypeResultAs: 'TypType'>
	^ TypTypeResolvers instance
		typForClass:
			(TypTypeLookup new
				clazz: self;
				yourself)
]
