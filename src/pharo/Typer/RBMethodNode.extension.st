Extension { #name : #RBMethodNode }

{ #category : #'*Typer' }
RBMethodNode >> typKnownArgumentTypesWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ arguments collect: [ :f | f typTypeWithDiscovered: aDictionary ]
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentAt: anInteger withDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ TypMethodResolvers instance
		typeForArgumentAt: anInteger
		ofMethod:
			(TypMethodLookup new
				receiverType: self methodClass typAsType;
				selector: selector asSymbol;
				argumentTypes: (self typKnownArgumentTypesWithDiscovered: aDictionary);
				yourself)
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentNamed: aSymbol withDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Symbol'>
	<typTypeArgument: 2 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := arguments detectIndex: [ :f | f name = aSymbol ].
	^ self typTypeForArgumentAt: i withDiscovered: aDictionary
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForResultWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ TypMethodResolvers instance
		typeForResultOfMethod:
			(TypMethodLookup new
				receiverType: self methodClass typAsType;
				selector: selector asSymbol;
				argumentTypes: (self typKnownArgumentTypesWithDiscovered: aDictionary);
				yourself)
]
