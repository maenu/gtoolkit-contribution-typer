Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ (self whoDefines: name) typTypeForArgumentNamed: name withDiscovered: aDictionary
]
