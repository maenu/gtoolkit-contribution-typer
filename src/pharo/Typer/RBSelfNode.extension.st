Extension { #name : #RBSelfNode }

{ #category : #'*Typer' }
RBSelfNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ self methodNode method methodClass typAsType
]
