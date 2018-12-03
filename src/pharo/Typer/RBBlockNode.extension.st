Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> typTypeAsUnknownWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ TypBlockClosureType new
		type: BlockClosure typAsType asNonParametricType;
		parameters: (arguments collect: [ :e | e typTypeWithDiscovered: aDictionary ]) , {(self typTypeForResultWithDiscovered: aDictionary)};
		internalResultType: (body typTypeWithDiscovered: aDictionary);
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
	(parent isMessage and: [ parent receiver ~~ self ])
		ifTrue: [ | i parent_ type internalResultType |
			parent_ := parent.	"typCastAs RBMessageNode"
			i := parent_ arguments detectIndex: [ :e | e == self ].
			internalResultType := body typTypeWithDiscovered: aDictionary.
			type := parent_ typTypeForArgumentAt: i withDiscovered: aDictionary.
			^ type isBlockClosure
				ifTrue: [ type copy
						internalResultType: internalResultType;
						yourself ]
				ifFalse: [ type isParametric
						ifTrue: [ TypBlockClosureType new
								type: type type;
								parameters: type parameters;
								internalResultType: internalResultType;
								yourself ]
						ifFalse: [ BlockClosure typAsType copy
								internalResultType: internalResultType;
								yourself ] ] ].
	^ self typTypeAsUnknownWithDiscovered: aDictionary
]
