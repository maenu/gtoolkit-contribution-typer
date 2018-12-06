Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer' }
RBInstanceVariableNode >> typTypeRecursive [
	^ self methodNode methodClass typTypeForVariable: name asSymbol
]
