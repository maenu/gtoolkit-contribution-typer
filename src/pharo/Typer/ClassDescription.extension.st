Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typAsType [
	^ TypClassType new
		clazz: self name asSymbol;
		yourself
]
