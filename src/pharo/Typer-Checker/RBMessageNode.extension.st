Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Checker' }
RBMessageNode >> typCheCheckArgumentCompatibilityAt: anInteger [
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
	[ (receiverType hasClass and: [ receiverType asClass includesSelector: self selector ])
		ifTrue: [ ^ self ].
	receiverType := receiverType superType ] doWhileTrue: [ receiverType hasSuperType ].
	(receiverType hasClass and: [ receiverType asClass includesSelector: self selector ])
		ifTrue: [ ^ self ].
	TypCheNoMethodError new
		type: self receiver typType;
		selector: self selector;
		signal
]
