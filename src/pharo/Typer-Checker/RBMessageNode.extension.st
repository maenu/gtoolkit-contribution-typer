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
				and: [ (argument body typSignalsAlways = true or: [ argument body lastIsReturn ])
						and: [ expected hasParamatersCompatibleWithThoseOf: actual ] ] ])
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
	(receiverType asNonNullableType typCheHasMethod: self selector)
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
	self typTypeForReceiver nullable
		ifFalse: [ ^ self ].
	TypCheNullableTypeError new
		type: receiverType;
		signal
]
