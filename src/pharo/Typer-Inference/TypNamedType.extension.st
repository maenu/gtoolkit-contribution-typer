Extension { #name : #TypNamedType }

{ #category : #'*Typer-Inference' }
TypNamedType >> typInfAbstractInterpret: aMessageNode [
	self hasClassDescription ifFalse: [ ^ self ].
	self classDescription typInfAbstractInterpret: aMessageNode for: self
]
