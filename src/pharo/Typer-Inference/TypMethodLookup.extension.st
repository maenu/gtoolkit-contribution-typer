Extension { #name : #TypMethodLookup }

{ #category : #'*Typer-Inference' }
TypMethodLookup >> typInfAsContextPath [
	| method |
	method := receiver classDescription lookupSelector: selector.
	^ {#context.
		method methodClass.
		method selector.
		self}
]
