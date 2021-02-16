Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typSignalsAlways [
	^ self statements anySatisfy: [ :e | e typSignalsAlways = true ]
]

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typTypeRecursive [
	self statements ifEmpty: [ ^ TypNilType new ].
	^ (self statements collect: #typType) last
]
