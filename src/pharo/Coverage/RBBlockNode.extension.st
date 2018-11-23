Extension { #name : #RBBlockNode }

{ #category : #'*Coverage' }
RBBlockNode >> covClasses [
	^ CovSummary new
		increment: BlockClosure;
		yourself
]

{ #category : #'*Coverage' }
RBBlockNode >> covClassesForArgumentNamed: aString [
	^ ((self allChildren select: [ :e | e isArgument and: [ e parent isMessage or: [ e parent isReturn ] ] ])
		collect: [ :e | 
			e parent isReturn
				ifTrue: [ e parent covClasses ]
				ifFalse: [ | message |
					message := e parent.
					(message receiver isArgument and: [ message receiver name = aString ])
						ifTrue: [ message covClassesForReceiver ]
						ifFalse: [ | i |
							i := message arguments detectIndex: [ :f | f isArgument and: [ f name = aString ] ].
							message covClassesForArgumentAt: i ] ] ]) inject: CovSummary new into: [ :a :b | a , b ]
]
