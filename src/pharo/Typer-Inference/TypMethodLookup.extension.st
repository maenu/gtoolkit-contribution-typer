Extension { #name : #TypMethodLookup }

{ #category : #'*Typer-Inference' }
TypMethodLookup >> typInfAsLookup: aMessage [
	^ TypInfMethodLookup
		receiver: receiver
		selector: selector
		arguments: arguments
		self: selfType
		super: superType
		message: aMessage
		parent: nil
]
