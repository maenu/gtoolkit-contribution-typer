Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typAsType [
	^ TypNamedType new
		name: self name asSymbol;
		yourself
]
