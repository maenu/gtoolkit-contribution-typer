Extension { #name : #TypMethodLookup }

{ #category : #'*Typer-Inference' }
TypMethodLookup >> typInfAsContextPath [
	| method |
	method := self compiledMethod.
	^ {#context.
		method methodClass.
		method selector.
		self}
]
