Extension { #name : 'RBSequenceNode' }

{ #category : '*Typer-Inference' }
RBSequenceNode >> typInfTypeRecursive [
	statements ifEmpty: [ ^ self typInfNil ].
	^ (statements collect: #typInfType) last
]
