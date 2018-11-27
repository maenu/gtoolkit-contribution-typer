Extension { #name : #Collection }

{ #category : #'*Typer' }
Collection >> typAsType [
	| type |
	type := TypUnionType new.
	self do: [ :e | type increment: e ].
	^ type asType
]
