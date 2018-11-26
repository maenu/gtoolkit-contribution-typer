Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentNamed: aSymbol [
	^ self typTypeForArgumentNamed: aSymbol withDiscovered: Set new
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeForArgumentNamed: aSymbol withDiscovered: aSet [
	^ (((self allChildren select: [ :e | e isArgument and: [ e parent isMessage or: [ e parent isReturn ] ] ]) collect: #parent)
		collect: [ :e | 
			e isReturn
				ifTrue: [ e typTypeWithDiscovered: aSet ]
				ifFalse: [ (e receiver isArgument and: [ e receiver name = aSymbol ])
						ifTrue: [ e typTypeForReceiverWithDiscovered: aSet ]
						ifFalse: [ | i |
							i := e arguments detectIndex: [ :f | f isArgument and: [ f name = aSymbol ] ] ifNone: [ 0 ].
							i > 0
								ifTrue: [ e typTypeForArgumentAt: i withDiscovered: aSet ]
								ifFalse: [ TypUnknownType instance ] ] ] ]) typAsCompatibleType
]

{ #category : #'*Typer' }
RBBlockNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ BlockClosure typAsType
]
