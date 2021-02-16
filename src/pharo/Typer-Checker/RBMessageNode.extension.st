Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckArgumentCompatibilityAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| argument expected actual |
	argument := self arguments at: anInteger.
	expected := self typInfTypeForArgumentAt: anInteger.
	actual := argument typType.
	(expected isUnknown or: [ actual isUnknown ])
		ifTrue: [ ^ self ].
	expected asNonNullable >= actual asNonNullable
		ifTrue: [ ^ self ].
	(actual isFunction
		and: [ actual result isUnknown
			or: [ argument isBlock and: [ argument body typSignalsAlways = true or: [ argument body lastIsReturn ] ] ] ])
		ifTrue: [ ^ self ].
	TypCheIncompatibleTypeError new
		expected: expected;
		actual: actual;
		signal
]

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckMethod [
	| receiverType |
	receiverType := self typReceiverType.
	receiverType isUnknown
		ifTrue: [ ^ self ].
	(receiverType asNonNullable canUnderstand: self selector)
		ifTrue: [ ^ self ].
	TypCheNoMethodError new
		type: receiverType;
		selector: self selector;
		signal
]

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckReceiver [
	| receiverType |
	receiverType := self typReceiverType.
	receiverType isUnknown
		ifTrue: [ ^ self ].
	(receiverType canUnderstand: self selector)
		ifTrue: [ ^ self ].
	receiverType isNullable
		ifFalse: [ ^ self ].
	TypCheNullableTypeError new
		type: receiverType;
		signal
]
