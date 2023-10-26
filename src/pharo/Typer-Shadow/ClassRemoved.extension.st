Extension { #name : #ClassRemoved }

{ #category : #'*Typer-Shadow' }
ClassRemoved >> typShaInvalidate [
	<typInvalidate: 30>
	TypShaIndex instance
		removeBehavior: classRemoved;
		removeBehavior: classRemoved class
]
