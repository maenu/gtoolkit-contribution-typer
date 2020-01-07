Extension { #name : #RBSelfNode }

{ #category : #'*Typer-Core' }
RBSelfNode >> typTypeRecursiveIn: aContext [
	^ TypTypeVariableType
		named: '@self'
		superType: self methodNode method methodClass typAsType
]
