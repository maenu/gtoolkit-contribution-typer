Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typAsType [
	<typTypeResultAs: 'TypType'>
	^ TypNamedType new
		name: self name asSymbol;
		yourself
]
