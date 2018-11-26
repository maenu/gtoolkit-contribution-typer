Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentNamed: aSymbol withDiscovered: aSet [
	^ ((self allChildren select: [ :e | e isArgument and: [ e name = aSymbol and: [ e parent isMessage or: [ e parent isReturn ] ] ] ]) collect: #parent)
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
					types ] ]
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ TypParametricType new
		clazz: BlockClosure;
		parameters: {(arguments collect: [ :e | e typTypeWithDiscovered: aSet ])};
		yourself
]
