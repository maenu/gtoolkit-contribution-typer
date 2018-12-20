Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typType.
	(self parent isMessage and: [ self parent receiver ~~ self	"typCastAs RBMessageNode" ])
		ifTrue: [ | i parent_ type_ |
			parent_ := self parent.	"typCastAs RBMessageNode"
			i := parent_ arguments detectIndex: [ :e | e == self ].
			type_ := parent_ typTypeForArgumentAt: i.
			type_ isUnion
				ifTrue: [ type_ := TypUnionType new
						types:
							(type_ types
								select: [ :e | 
									| type__ |
									type__ := e asNonParametricType.
									(type__ isKindOf: TypNamedType)
										ifTrue: [ type__ name = 'BlockClosure' ]
										ifFalse: [ false ] ]);
						yourself	"typCastAs TypUnionType" ].
			type_ isParametric
				ifTrue: [ ^ type_ parameters at: anInteger	"typCastAs TypParametricType" ] ].
	(type isParametric and: [ anInteger < type parameters size	"typCastAs TypParametricType" ])
		ifTrue: [ ^ type parameters at: anInteger	"typCastAs TypParametricType" ].
	^ TypUnknownType instance
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentNamed: aString [
	<typTypeArgument: 1 as: 'String<Character>'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self typTypeForArgumentAt: i
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeRecursive [
	^ BlockClosure typAsType asFunctionType: (self arguments collect: #typType) result: self body typType optionalParameters: false
]
