Extension { #name : 'Symbol' }

{ #category : '*Typer-Inference' }
Symbol >> typInfImplementors [

	^ TypInfImplementorsCache instance implementors: self
]
