Extension { #name : #RBBlockNode }

{ #category : #'*Coverage' }
RBBlockNode >> covClassesForArgumentNamed: aString [
	^ self covClassesForArgumentNamed: aString withDiscovered: Set new
]

{ #category : #'*Coverage' }
RBBlockNode >> covClassesForArgumentNamed: aString withDiscovered: aSet [
	^ (((self allChildren select: [ :e | e isArgument and: [ e parent isMessage or: [ e parent isReturn ] ] ]) collect: #parent)
		collect: [ :e | 
			e isReturn
				ifTrue: [ e covClassesWithDiscovered: aSet ]
				ifFalse: [ (e receiver isArgument and: [ e receiver name = aString ])
						ifTrue: [ e covClassesForReceiverWithDiscovered: aSet ]
						ifFalse: [ | i |
							i := e arguments detectIndex: [ :f | f isArgument and: [ f name = aString ] ].
							e covClassesForArgumentAt: i withDiscovered: aSet ] ] ]) inject: CovSummary new into: [ :a :b | a , b ]
]

{ #category : #'*Coverage' }
RBBlockNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ CovSummary new
		increment: BlockClosure;
		yourself
]
