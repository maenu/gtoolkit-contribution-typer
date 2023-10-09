Extension { #name : #TypMethodLookup }

{ #category : #'*Typer-Inference' }
TypMethodLookup >> typInfAsContextPath [
	^ self
		typInfAsContextPath: (receiver classDescription lookupSelector: selector)
]

{ #category : #'*Typer-Inference' }
TypMethodLookup >> typInfAsContextPath: aMethod [
	^ {#context.
		aMethod methodClass.
		aMethod selector.
		self}
]
