Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckArgumentCompatibilityAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| expected actual |
	expected := self typTypeForArgumentAt: anInteger.
	actual := (self arguments at: anInteger) typType.
	expected >= actual
		ifFalse: [ TypCheIncompatibleTypeError new
				expected: expected;
				actual: actual;
				signal ]
]

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckMethod [
	| receiverType |
	receiverType := self receiver typType.
	(receiverType asNonNullableType typCheHasMethod: self selector)
		ifFalse: [ TypCheNoMethodError new
				type: receiverType;
				selector: self selector;
				signal ]
]

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckReceiver [
	| actual |
	actual := self typTypeForReceiver.
	self typTypeForReceiver nullable
		ifTrue: [ TypCheNullableTypeError new
				type: actual;
				signal ]
]
