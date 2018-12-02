Extension { #name : #Collection }

{ #category : #'*Typer' }
Collection >> typAsType [
	<typTypeResultAs: 'TypType'>
	| type |
	type := TypUnionType new.
	self do: [ :e "typCastAs TypType" | type increment: e ].
	^ type asType
]
