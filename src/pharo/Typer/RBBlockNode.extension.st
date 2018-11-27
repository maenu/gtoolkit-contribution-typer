Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> typTypeAsUnknownWithDiscovered: aDictionary [
	^ TypParametricType new
		type: BlockClosure typAsType;
		parameters: (arguments collect: [ :e | e typTypeWithDiscovered: aDictionary ]) , {(self typTypeForResultWithDiscovered: aDictionary)};
		yourself
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentAt: anInteger withDiscovered: aDictionary [
	| type |
	type := self typTypeWithDiscovered: aDictionary.
	(type isParametric and: [ anInteger < type parameters size ])
		ifTrue: [ ^ type parameters at: anInteger ].
	^ TypUnknownType instance
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentNamed: aSymbol withDiscovered: aDictionary [
	| i |
	i := arguments detectIndex: [ :f | f name = aSymbol ].
	^ self typTypeForArgumentAt: i withDiscovered: aDictionary
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeForResultWithDiscovered: aDictionary [
	| type |
	type := self typTypeWithDiscovered: aDictionary.
	(type isParametric and: [ type parameters isNotEmpty ])
		ifTrue: [ ^ type parameters last ].
	^ TypUnknownType instance
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeRecursiveWithDiscovered: aDictionary [
	| i |
	parent isMessage
		ifTrue: [ parent receiver == self
				ifTrue: [ ^ self typTypeAsUnknownWithDiscovered: aDictionary ].
			i := parent arguments detectIndex: [ :e | e == self ].
			^ parent typTypeForArgumentAt: i withDiscovered: aDictionary ].
	^ self typTypeAsUnknownWithDiscovered: aDictionary
]
