Extension { #name : #RBSelfNode }

{ #category : #'*Typer' }
RBSelfNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ self methodNode method methodClass typAsType
]
