Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer' }
RBInstanceVariableNode >> typTypeRecursiveWithDiscovered: aDictionary [
	| type |
	type := self methodNode methodClass typAsType.
	^ TypVariableResolvers instance typeForVariable: type -> name
]
