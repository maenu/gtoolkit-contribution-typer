Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer' }
RBInstanceVariableNode >> typTypeRecursive [
	| type |
	type := self methodNode methodClass typAsType.
	^ TypVariableResolvers global
		typeForVariable:
			(TypVariableLookup new
				receiverType: type;
				selector: name asSymbol;
				yourself)
]
