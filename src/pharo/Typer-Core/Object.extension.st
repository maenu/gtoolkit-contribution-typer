Extension { #name : #Object }

{ #category : #'*Typer-Core' }
Object >> typSelfType [
	<typTypeResultAs: 'TypType'>
	^ self class typAsType
]
