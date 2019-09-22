Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typTypeRecursive [
	^ self methodNode methodClass typTypeForVariable: self name asSymbol
]
