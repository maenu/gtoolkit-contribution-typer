Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> _typTypeForArgumentAt: anInteger withDiscovered: aSet [
	| aSymbol |
	self flag: 'finds types based on use of arg, which is useful for finding conflict, not determining types'.
	^ (((self allChildren select: [ :e | e isArgument and: [ e name = aSymbol and: [ e parent isMessage or: [ e parent isReturn ] ] ] ]) collect: #parent)
		collect: [ :e | 
			e isReturn
				ifTrue: [ e methodNode typTypeForResultWithDiscovered: aSet ]
				ifFalse: [ | types i |
					types := TypUnionType new.
					(e receiver isArgument and: [ e receiver name = aSymbol ])
						ifTrue: [ types increment: (e typTypeForReceiverWithDiscovered: aSet) ].
					i := e arguments detectIndex: [ :f | f isArgument and: [ f name = aSymbol ] ] ifNone: [ 0 ].
					i > 0
						ifTrue: [ types increment: (e typTypeForArgumentAt: i withDiscovered: aSet) ]
						ifFalse: [ types increment: TypUnknownType instance ].
					types ] ]) typAsType
]

{ #category : #'*Typer' }
RBBlockNode >> _typTypeForArgumentNamedInternal: aSymbol withDiscovered: aSet [
	self flag: 'finds types based on use of arg, which is useful for finding conflict, not determining types'.
	^ (((self allChildren select: [ :e | e isArgument and: [ e name = aSymbol and: [ e parent isMessage or: [ e parent isReturn ] ] ] ]) collect: #parent)
		collect: [ :e | 
			e isReturn
				ifTrue: [ e methodNode typTypeForResultWithDiscovered: aSet ]
				ifFalse: [ | types i |
					types := TypUnionType new.
					(e receiver isArgument and: [ e receiver name = aSymbol ])
						ifTrue: [ types increment: (e typTypeForReceiverWithDiscovered: aSet) ].
					i := e arguments detectIndex: [ :f | f isArgument and: [ f name = aSymbol ] ] ifNone: [ 0 ].
					i > 0
						ifTrue: [ types increment: (e typTypeForArgumentAt: i withDiscovered: aSet) ]
						ifFalse: [ types increment: TypUnknownType instance ].
					types ] ]) typAsType
]

{ #category : #'*Typer' }
RBBlockNode >> _typTypeFromExternalUsageWithDiscovered: aSet [
	| aSymbol |
	self flag: 'finds types based on use of arg, which is useful for finding conflict, not determining types'.
	^ (((self allChildren select: [ :e | e isArgument and: [ e name = aSymbol and: [ e parent isMessage or: [ e parent isReturn ] ] ] ]) collect: #parent)
		collect: [ :e | 
			e isReturn
				ifTrue: [ e methodNode typTypeForResultWithDiscovered: aSet ]
				ifFalse: [ | types i |
					types := TypUnionType new.
					(e receiver isArgument and: [ e receiver name = aSymbol ])
						ifTrue: [ types increment: (e typTypeForReceiverWithDiscovered: aSet) ].
					i := e arguments detectIndex: [ :f | f isArgument and: [ f name = aSymbol ] ] ifNone: [ 0 ].
					i > 0
						ifTrue: [ types increment: (e typTypeForArgumentAt: i withDiscovered: aSet) ]
						ifFalse: [ types increment: TypUnknownType instance ].
					types ] ]) typAsType
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeAsUnknownWithDiscovered: aDictionary [
	^ TypParametricType new
		clazz: BlockClosure;
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
