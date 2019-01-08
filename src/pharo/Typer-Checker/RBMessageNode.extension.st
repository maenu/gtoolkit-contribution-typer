Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckArgumentCompatibilityAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| expected actual |
	expected := self typTypeForArgumentAt: anInteger.
	actual := (self arguments at: anInteger) typType.
	(expected isUnknown or: [ actual isUnknown ])
		ifTrue: [ ^ self ].
	expected >= actual
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
