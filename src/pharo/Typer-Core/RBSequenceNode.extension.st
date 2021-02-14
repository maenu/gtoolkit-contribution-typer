Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Core' }
RBSequenceNode >> typSignalsAlways [
	^ self statements anySatisfy: [ :e | (e typSignalsAlways) = true ]
]

{ #category : #'*Typer-Core' }
RBSequenceNode >> typTypeRecursive [
	self statements ifEmpty: [ ^ TypNilType instance ].
	^ (self statements collect: #typType) last
]
