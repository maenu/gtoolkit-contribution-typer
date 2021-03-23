Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typInfTypeRecursive [
	statements
		ifEmpty: [ ^ TypNilType new
				addOrigin: (TypInfNodeOrigin node: self);
				yourself ].
	^ (statements collect: #typInfType) last
]
