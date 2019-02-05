Extension { #name : #RBSelfNode }

{ #category : #'*Typer' }
RBSelfNode >> typTypeRecursive [
	^ [self methodNode method methodClass typAsType ] on: KeyNotFound do: [ TypUnknownType instance ]
]
