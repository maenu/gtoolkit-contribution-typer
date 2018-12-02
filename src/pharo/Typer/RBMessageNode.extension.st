Extension { #name : #RBMessageNode }

{ #category : #'*Typer' }
RBMessageNode >> typKnownArgumentTypesWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ arguments collect: [ :f | f typTypeWithDiscovered: aDictionary ]
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForArgumentAt: anInteger withDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	| receiverType |
	receiverType := self typTypeForReceiverWithDiscovered: aDictionary.
	^ TypMethodResolvers instance typeForArgumentAt: anInteger ofMethod: receiverType -> (selector -> (self typKnownArgumentTypesWithDiscovered: aDictionary))
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForReceiverWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ receiver typTypeWithDiscovered: aDictionary
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForResultWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	| receiverType |
	receiverType := self typTypeForReceiverWithDiscovered: aDictionary.
	^ TypMethodResolvers instance typeForResultOfMethod: receiverType -> (selector -> (self typKnownArgumentTypesWithDiscovered: aDictionary))
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ self typTypeForResultWithDiscovered: aDictionary
]
