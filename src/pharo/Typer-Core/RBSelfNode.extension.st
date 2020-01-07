Extension { #name : #RBSelfNode }

{ #category : #'*Typer-Core' }
RBSelfNode >> typTypeRecursive [
	^ TypTypeVariableType
		named: '@self'
		superType: self methodNode method methodClass typAsType
]
