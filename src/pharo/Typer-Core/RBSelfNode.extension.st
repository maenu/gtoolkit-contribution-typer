Extension { #name : #RBSelfNode }

{ #category : #'*Typer-Core' }
RBSelfNode >> typTypeRecursive [
	^ [self methodNode method methodClass typAsType ] on: KeyNotFound do: [ TypUnknownType instance ]
]
