Extension { #name : #Object }

{ #category : #'*Typer-Inference' }
Object >> typInfSelfType [

	^ self class typAsType copyWithValue: self
]
