Extension { #name : #RBSuperNode }

{ #category : #'*Typer' }
RBSuperNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ self methodNode method methodClass superclass typAsType
]
