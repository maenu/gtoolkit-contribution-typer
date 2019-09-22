Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeForArgumentAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typType.
	(self parent isMessage and: [ (self parent "typCastAs RBMessageNode") receiver ~~ self ])
		ifTrue: [ | i parent_ type_ |
			parent_ := self parent "typCastAs RBMessageNode".
			i := parent_ arguments detectIndex: [ :e | e == self ].
			type_ := parent_ typTypeForArgumentAt: i.
			type_ isUnion
				ifTrue: [ type_ := ((type_ "typCastAs TypUnionType") types
								select: [ :e | e isNamed and: [ (e "typCastAs TypNamedType") name = 'BlockClosure' ] ]) typAsType ].
			(type_ isParametric and: [ anInteger <= (type_ "typCastAs TypParametricType") parameters size ])
				ifTrue: [ ^ self typAnnotateType: ((type_ "typCastAs TypParametricType") parameters at: anInteger) ] ].
	(type isParametric and: [ anInteger <= (type "typCastAs TypParametricType") parameters size ])
		ifTrue: [ ^ self typAnnotateType: ((type "typCastAs TypParametricType") parameters at: anInteger) ].
	^ self typAnnotateType: TypUnknownType instance
]

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeForArgumentNamed: aString [
	<typTypeArgument: 1 as: 'String<Character>'>
	<typTypeResultAs: 'TypType'>
	| i |
	i := self arguments detectIndex: [ :f | f name = aString ].
	^ self typTypeForArgumentAt: i
]

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeForResult [
	<typTypeResultAs: 'TypType'>
	^ (self typType "typCastAs TypFunctionType") result
]

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeRecursive [
	^ BlockClosure typAsType asFunctionType: (self arguments collect: #typType) result: self body typType optionalParameters: false
]
