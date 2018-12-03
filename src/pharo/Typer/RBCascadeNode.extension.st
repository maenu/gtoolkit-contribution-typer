Extension { #name : #RBCascadeNode }

{ #category : #'*Typer' }
RBCascadeNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ messages last typType
]
