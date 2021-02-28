Extension { #name : #Object }

{ #category : #'*Typer-Inference' }
Object >> typInfSelfType [
	<typTypeResultAs: 'TypType'>
	^ self class typAsType
]
