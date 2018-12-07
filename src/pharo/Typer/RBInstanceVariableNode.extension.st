Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer' }
RBInstanceVariableNode >> typTypeRecursive [
	^ self methodNode methodClass typTypeForVariable: self name asSymbol
]
