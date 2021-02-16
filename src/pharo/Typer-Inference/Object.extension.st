Extension { #name : #Object }

{ #category : #'*Typer-Inference' }
Object >> typSelfType [
	<typTypeResultAs: 'TypType'>
	^ self class typAsType
]
