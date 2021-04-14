Extension { #name : #Object }

{ #category : #'*Typer-Inference' }
Object >> typInfSelfType [
	<typPraResult: 'TypType'>
	^ self class typAsType
		value: self;
		yourself
]
