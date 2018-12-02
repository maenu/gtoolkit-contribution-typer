Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> typTypeAsUnknownWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ TypParametricType new
		type: BlockClosure typAsType asNonParametricType;
		parameters: (arguments collect: [ :e | e typTypeWithDiscovered: aDictionary ]) , {(self typTypeForResultWithDiscovered: aDictionary)};
		yourself
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentAt: anInteger withDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typTypeWithDiscovered: aDictionary.
	(type isParametric and: [ anInteger < type parameters size ])
		ifTrue: [ ^ type parameters at: anInteger ].
	^ TypUnknownType instance
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentNamed: aSymbol withDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Symbol'>
	<typTypeArgument: 2 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := arguments detectIndex: [ :f | f name = aSymbol ].
	^ self typTypeForArgumentAt: i withDiscovered: aDictionary
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeForResultWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typTypeWithDiscovered: aDictionary.
	(type isParametric and: [ type parameters isNotEmpty ])
		ifTrue: [ ^ type parameters last ].
	^ TypUnknownType instance
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	parent isMessage
		ifTrue: [ | i |
			parent receiver == self
				ifTrue: [ ^ self typTypeAsUnknownWithDiscovered: aDictionary ].
			i := parent "typCastAs RBMessageNode" arguments detectIndex: [ :e | e == self ].
			^ parent typTypeForArgumentAt: i withDiscovered: aDictionary ].
	^ self typTypeAsUnknownWithDiscovered: aDictionary
]
