Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer' }
RBInstanceVariableNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
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
