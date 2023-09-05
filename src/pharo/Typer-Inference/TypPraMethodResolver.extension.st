Extension { #name : #TypPraMethodResolver }

{ #category : #'*Typer-Inference' }
TypPraMethodResolver >> typInfContext: aLookup [
	| methodClass selfType |
	methodClass := aLookup receiver classDescription.
	selfType := methodClass typAsType.
	^ TypInfMethodResolver instance
		contextAt: (methodClass >> aLookup selector) ast
		self: selfType
		super: selfType superOrNil
]
