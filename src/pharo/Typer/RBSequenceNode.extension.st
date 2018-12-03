Extension { #name : #RBSequenceNode }

{ #category : #'*Typer' }
RBSequenceNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	statements ifEmpty: [ ^ TypNilType instance ].
	^ statements last typType
]
