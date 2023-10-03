Extension { #name : #TypInfMessage }

{ #category : #'*Typer-Checker' }
TypInfMessage >> typChe [
	| receiver |
	receiver := self receiver.
	(receiver canLookupMethod: self selector)
		ifTrue: [ self typCheArgumentsWithReceiver: receiver ]
		ifFalse: [ (receiver asNonNullable canLookupMethod: self selector)
				ifTrue: [ TypCheNullable signal: self inReceiver message: 'receiver is nullable'.
					self typCheArgumentsWithReceiver: receiver asNonNullable ]
				ifFalse: [ TypCheNoMethod signal: self selector: self selector ] ]
]

{ #category : #'*Typer-Checker' }
TypInfMessage >> typCheArgumentsWithReceiver: aType [
	| expecteds actuals |
	expecteds := (TypMethodIndex instance
			resolve: (self lookup withReceiver: aType)) arguments.
	actuals := aType arguments.
	1
		to: (expecteds size min: actuals size)
		do: [ :i | 
			| expected actual |
			expected := expecteds at: i.
			actual := actuals at: i.
			expected >= actual
				ifFalse: [ TypCheIncompatible signal: (self inArgumentAt: i) expected: expected ] ]
]
