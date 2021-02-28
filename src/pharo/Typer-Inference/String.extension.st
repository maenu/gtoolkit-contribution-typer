Extension { #name : #String }

{ #category : #'*Typer-Inference' }
String >> typInfSelfType [
	^ self class typAsType
]
