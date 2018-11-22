Extension { #name : #RBBlockNode }

{ #category : #'*Coverage' }
RBBlockNode >> covClass [
	^ BlockClosure
]

{ #category : #'*Coverage' }
RBBlockNode >> covClassForArgumentNamed: aString [
	| summary |
	summary := CovSummary new.
	((self allChildren select: [ :e | e isArgument and: [ e parent isMessage or: [ e parent isReturn ] ] ])
		collect: [ :e | 
			e parent isReturn
				ifTrue: [ e parent covClass ]
				ifFalse: [ | message |
					message := e parent.
					(message receiver isArgument and: [ message receiver name = aString ])
						ifTrue: [ message covClassForReceiver ]
						ifFalse: [ | i |
							i := message arguments detectIndex: [ :f | f isArgument and: [ f name = aString ] ].
							message covClassForArgumentAt: i ] ] ]) do: [ :e | summary add: e ].
	^ summary inferredClass
]
