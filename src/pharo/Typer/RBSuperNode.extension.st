Extension { #name : #RBSuperNode }

{ #category : #'*Typer' }
RBSuperNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ self methodNode method methodClass superclass typAsType
]
