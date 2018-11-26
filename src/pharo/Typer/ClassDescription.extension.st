Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typAsType [
	^ TypClassType new
		clazz: self;
		yourself
]
