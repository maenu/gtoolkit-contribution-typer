Extension { #name : #TypNamedType }

{ #category : #'*Typer-Inference' }
TypNamedType >> typInfAbstractInterpret: aMessageNode [
	self hasClassDescription ifFalse: [ ^ false ].
	^ self classDescription typInfAbstractInterpret: aMessageNode
]
