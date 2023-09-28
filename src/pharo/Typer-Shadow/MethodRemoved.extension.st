Extension { #name : #MethodRemoved }

{ #category : #'*Typer-Shadow' }
MethodRemoved >> typShaInvalidateIndex [
	TypShaIndex instance removeMethod: method
]
