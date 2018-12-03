Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer' }
RBInstanceVariableNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	| type |
	type := self methodNode methodClass typAsType.
	^ TypVariableResolvers instance
		typeForVariable:
			(TypVariableLookup new
				receiverType: type;
				selector: name asSymbol;
				yourself)
]
