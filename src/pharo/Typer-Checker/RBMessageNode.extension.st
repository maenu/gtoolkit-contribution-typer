Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckArgumentCompatibilityAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| argument expected actual |
	argument := self arguments at: anInteger.
	expected := self typTypeForArgumentAt: anInteger.
	actual := argument typType.
	(expected isUnknown or: [ actual isUnknown ])
		ifTrue: [ ^ self ].
	expected >= actual
		ifTrue: [ ^ self ].
	(actual isFunction
		and: [ argument isBlock
				and: [ | block |
					block := argument "typCastAs RBBlockNode".
					(block body typSignalsAlways = true
						or: [ block body lastIsReturn ])
						and: [ | functions |
							functions := expected isUnion
								ifTrue:
									[ ((expected "typCastAs TypUnionType") types select: [ :e | e isFunction ]) "typParameters TypFunctionType" ]
								ifFalse: [ expected isFunction
										ifTrue: [ {expected "typCastAs TypFunctionType"} ]
										ifFalse: [ {} "typParameters TypFunctionType" ] ].
							functions anySatisfy: [ :e | e hasParamatersCompatibleWithThoseOf: (actual "typCastAs TypFunctionType") ] ] ] ])
		ifTrue: [ ^ self ].
	TypCheIncompatibleTypeError new
		expected: expected;
		actual: actual;
		signal
]

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckMethod [
	| receiverType |
	receiverType := self typTypeForReceiver.
	receiverType isUnknown
		ifTrue: [ ^ self ].
	(receiverType asNonNullableType canUnderstand: self selector)
		ifTrue: [ ^ self ].
	TypCheNoMethodError new
		type: receiverType;
		selector: self selector;
		signal
]

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckReceiver [
	| receiverType |
	receiverType := self typTypeForReceiver.
	receiverType isUnknown
		ifTrue: [ ^ self ].
	receiverType nullable
		ifFalse: [ ^ self ].
	TypCheNullableTypeError new
		type: receiverType;
		signal
]
