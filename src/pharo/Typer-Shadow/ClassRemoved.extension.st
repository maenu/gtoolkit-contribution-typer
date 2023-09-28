Extension { #name : #ClassRemoved }

{ #category : #'*Typer-Shadow' }
ClassRemoved >> typShaInvalidateIndex [
	TypShaIndex instance
		removeBehavior: classRemoved;
		removeBehavior: classRemoved class
]
