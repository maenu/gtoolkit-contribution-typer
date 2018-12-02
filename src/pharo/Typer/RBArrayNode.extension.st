Extension { #name : #RBArrayNode }

{ #category : #'*Typer' }
RBArrayNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ TypParametricType new
		type: Array typAsType;
		parameters: {(statements ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (statements collect: [ :e | e typTypeWithDiscovered: aDictionary ]) typAsType ])};
		yourself
]
