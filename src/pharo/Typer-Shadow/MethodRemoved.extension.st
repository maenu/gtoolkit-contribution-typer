Extension { #name : #MethodRemoved }

{ #category : #'*Typer-Shadow' }
MethodRemoved >> typShaInvalidate [
	<typInvalidate: 30>
	TypShaIndex instance removeMethod: method
]
