Extension { #name : #MethodRemoved }

{ #category : #'*Typer-Inference' }
MethodRemoved >> typInfInvalidate [
	<typInvalidate: 20>
	TypInfIndex instance removeMethod: method
]
