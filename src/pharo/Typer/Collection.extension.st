Extension { #name : #Collection }

{ #category : #'*Typer' }
Collection >> typAsType [
	<typTypeResultAs: 'TypType'>
	^ TypUnionType new
		types: self asSet;
		asType
]
