Extension { #name : #RBThisContextNode }

{ #category : #'*Typer' }
RBThisContextNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ Context typAsType
]
