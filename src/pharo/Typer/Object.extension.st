Extension { #name : #Object }

{ #category : #'*Typer' }
Object >> typSelfType [
	<typTypeResultAs: 'TypType'>
	^ self class typAsType
]
