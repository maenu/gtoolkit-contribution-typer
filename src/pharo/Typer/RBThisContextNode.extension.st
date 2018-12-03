Extension { #name : #RBThisContextNode }

{ #category : #'*Typer' }
RBThisContextNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ Context typAsType
]
