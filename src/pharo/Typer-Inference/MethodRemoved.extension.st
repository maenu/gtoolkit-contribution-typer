Extension { #name : #MethodRemoved }

{ #category : #'*Typer-Inference' }
MethodRemoved >> typInfInvalidateIndex [
	TypInfIndex instance removeMethod: method
]
