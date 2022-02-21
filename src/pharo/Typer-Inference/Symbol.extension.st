Extension { #name : #Symbol }

{ #category : #'*Typer-Inference' }
Symbol >> typInfImplementors [

	self flag: 'REMOVE'.
	^ TypInfImplementorsCache instance implementors: self
]
