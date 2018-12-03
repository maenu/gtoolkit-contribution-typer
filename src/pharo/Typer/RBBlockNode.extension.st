Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentAt: anInteger withDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typTypeWithDiscovered: aDictionary.
	(type isParametric and: [ anInteger < type parameters size ])
		ifTrue: [ (parent isMessage and: [ parent receiver ~~ self ])
				ifTrue: [ | i parent_ type_ |
					parent_ := parent.	"typCastAs RBMessageNode"
					i := parent_ arguments detectIndex: [ :e | e == self ].
					type_ := parent_ typTypeForArgumentAt: i withDiscovered: aDictionary.
					type_ isParametric
						ifTrue: [ ^ type_ parameters at: anInteger ] ].
			^ type parameters at: anInteger ].
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
RBBlockNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ BlockClosure typAsType copy
		parameters:
			(arguments collect: [ :e | e typTypeWithDiscovered: aDictionary ])
				, {(body typTypeWithDiscovered: aDictionary)};
		yourself
]
