Extension { #name : #TypInfMessage }

{ #category : #'*Typer-Checker' }
TypInfMessage >> typCheCheckArgumentCompatibilityAt: anInteger [
	| argument expected actual |
	argument := self arguments at: anInteger.
	expected := self method arguments at: anInteger.
	actual := argument type.
	expected isUnknown ifTrue: [ ^ self ].
	actual isUnknown ifTrue: [ ^ self ].
	expected asNonNullable >= actual asNonNullable ifTrue: [ ^ self ].
	TypCheIncompatibleTypeError new
		expected: expected;
		actual: actual;
		signal
]

{ #category : #'*Typer-Checker' }
TypInfMessage >> typCheCheckMethod [
	| receiver |
	receiver := self receiver.
	receiver isUnknown ifTrue: [ ^ self ].
	(receiver asNonNullable canLookupMethod: self selector) ifFalse: [ ^ self ].
	TypCheNoMethodError new
		type: receiver;
		selector: self selector;
		signal
]

{ #category : #'*Typer-Checker' }
TypInfMessage >> typCheCheckReceiver [
	| receiver |
	receiver := self receiver.
	receiver isUnknown ifTrue: [ ^ self ].
	(receiver canLookupMethod: self selector) ifTrue: [ ^ self ].
	receiver isNullable ifFalse: [ ^ self ].
	TypCheNullableTypeError new
		type: receiver;
		signal
]
