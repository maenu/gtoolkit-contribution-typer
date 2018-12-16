Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typType.
	(self parent isMessage and: [ (self parent "typCastAs RBMessageNode") receiver ~~ self ])
		ifTrue: [ | i parent_ type_ |
			parent_ := self parent.	"typCastAs RBMessageNode"
			i := parent_ arguments detectIndex: [ :e | e == self ].
			type_ := parent_ typTypeForArgumentAt: i.
			type_ isUnion
				ifTrue: [ type_ := TypUnionType new
						types: ((type_ "typCastAs TypUnionType") types select: [ :e | e asNonParametricType name = 'BlockClosure' ]);
						yourself ].
			type_ isParametric
				ifTrue: [ ^ (type_ "typCastAs TypParametricType") parameters at: anInteger ] ].
	(type isParametric and: [ anInteger < (type "typCastAs TypParametricType") parameters size ])
		ifTrue: [ ^ (type "typCastAs TypParametricType") parameters at: anInteger ].
	^ TypUnknownType instance
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentNamed: aSymbol [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aSymbol ].
	^ self typTypeForArgumentAt: i
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeRecursive [
	^ BlockClosure typAsType asFunctionType: (self arguments collect: #typType) result: self body typType optionalParameters: false
]
