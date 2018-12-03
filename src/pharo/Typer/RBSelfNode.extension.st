Extension { #name : #RBSelfNode }

{ #category : #'*Typer' }
RBSelfNode >> typTypeRecursive [
	^ self methodNode method methodClass typAsType
]
