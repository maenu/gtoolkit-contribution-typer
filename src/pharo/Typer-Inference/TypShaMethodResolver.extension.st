Extension { #name : #TypShaMethodResolver }

{ #category : #'*Typer-Inference' }
TypShaMethodResolver >> typInfContext: aLookup [
	| methodClass selfType |
	methodClass := aLookup receiver classDescription.
	selfType := methodClass typAsType.
	^ TypInfMethodResolver instance
		contextAt: (methodClass
				>> (TypShaMethodIndex instance
						methodResolvers: methodClass
						selector: aLookup selector) anyOne) ast
		self: selfType
		super: selfType superOrNil
]
