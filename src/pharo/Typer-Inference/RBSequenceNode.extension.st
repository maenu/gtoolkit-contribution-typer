Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typInfTypeRecursive [
	self statements ifEmpty: [ ^ TypNilType new ].
	^ (self statements collect: #typInfType) last
]
