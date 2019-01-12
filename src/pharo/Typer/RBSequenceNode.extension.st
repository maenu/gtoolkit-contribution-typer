Extension { #name : #RBSequenceNode }

{ #category : #'*Typer' }
RBSequenceNode >> typSignalsAlways [
	^ self statements anySatisfy: [ :e | e typSignalsAlways = true ]
]

{ #category : #'*Typer' }
RBSequenceNode >> typTypeRecursive [
	self statements ifEmpty: [ ^ TypNilType instance ].
	^ (self statements collect: #typType) last
]
