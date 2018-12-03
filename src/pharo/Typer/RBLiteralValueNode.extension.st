Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer' }
RBLiteralValueNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ value class typAsType
]
