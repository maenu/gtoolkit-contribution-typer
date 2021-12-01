Extension { #name : #String }

{ #category : #'*Typer-Inference' }
String >> typInfType [

	^ self class typAsType copyWithValue: self
]
