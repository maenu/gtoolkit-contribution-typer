Extension { #name : #RBSequenceNode }

{ #category : #'*Typer' }
RBSequenceNode >> typTypeRecursive [
	self statements ifEmpty: [ ^ TypNilType instance ].
	^ (self statements collect: #typType) last
]
