Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typInfTypeRecursive [
	statements ifEmpty: [ ^ TypNilType new ].
	^ (statements collect: #typInfType) last
]
