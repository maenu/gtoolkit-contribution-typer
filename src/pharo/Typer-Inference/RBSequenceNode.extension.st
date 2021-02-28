Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typInfSignalsAlways [
	^ self statements anySatisfy: [ :e | e typInfSignalsAlways = true ]
]

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typInfTypeRecursive [
	self statements ifEmpty: [ ^ TypNilType new ].
	^ (self statements collect: #typInfType) last
]
