Extension { #name : #RBSelfNode }

{ #category : #'*Typer' }
RBSelfNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ self methodNode method methodClass typAsType
]
