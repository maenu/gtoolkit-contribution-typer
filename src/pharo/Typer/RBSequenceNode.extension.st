Extension { #name : #RBSequenceNode }

{ #category : #'*Typer' }
RBSequenceNode >> typTypeRecursive [
	statements ifEmpty: [ ^ TypNilType instance ].
	^ statements last typType
]
