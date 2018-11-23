Extension { #name : #RBBlockNode }

{ #category : #'*Typer' }
RBBlockNode >> typTypesForArgumentNamed: aString [
	^ self typTypesForArgumentNamed: aString withDiscovered: Set new
]

{ #category : #'*Typer' }
RBBlockNode >> typTypesForArgumentNamed: aString withDiscovered: aSet [
	^ (((self allChildren select: [ :e | e isArgument and: [ e parent isMessage or: [ e parent isReturn ] ] ]) collect: #parent)
		collect: [ :e | 
			e isReturn
				ifTrue: [ e typTypesWithDiscovered: aSet ]
				ifFalse: [ (e receiver isArgument and: [ e receiver name = aString ])
						ifTrue: [ e typTypesForReceiverWithDiscovered: aSet ]
						ifFalse: [ | i |
							i := e arguments detectIndex: [ :f | f isArgument and: [ f name = aString ] ] ifNone: [ 0 ].
							i > 0
								ifTrue: [ e typTypesForArgumentAt: i withDiscovered: aSet ]
								ifFalse: [ TypTypes new ] ] ] ]) inject: TypTypes new into: [ :a :b | a , b ]
]

{ #category : #'*Typer' }
RBBlockNode >> typTypesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypTypes new ].
	aSet add: self.
	^ TypTypes new
		increment: BlockClosure;
		yourself
]
