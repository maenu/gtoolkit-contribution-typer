Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typType.
	(parent isMessage and: [ parent receiver ~~ self ])
		ifTrue: [ | i parent_ type_ |
			parent_ := parent.	"typCastAs RBMessageNode"
			i := parent_ arguments detectIndex: [ :e | e == self ].
			type_ := parent_ typTypeForArgumentAt: i.
			type_ isParametric
				ifTrue: [ ^ type_ parameters at: anInteger ] ].
	(type isParametric and: [ anInteger < type parameters size ])
		ifTrue: [ ^ type parameters at: anInteger ].
	^ TypUnknownType instance
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentNamed: aSymbol [
	<typTypeArgument: 1 as: 'Symbol'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := arguments detectIndex: [ :f | f name = aSymbol ].
	^ self typTypeForArgumentAt: i
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeRecursive [
	^ BlockClosure typAsType asParametricType: (arguments collect: #typType) , {body typType}
]
