Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ TypParametricType new
		type: Array typAsType asNonParametricType;
		parameters: {(contents ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (contents collect: [ :e | e typTypeWithDiscovered: aDictionary ]) typAsType ])};
		yourself
]
