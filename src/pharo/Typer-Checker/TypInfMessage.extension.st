Extension { #name : #TypInfMessage }

{ #category : #'*Typer-Checker' }
TypInfMessage >> typCheArgumentsWithReceiver: aType on: aStream [
	aType types
		do: [ :t | 
			| expecteds actuals |
			expecteds := (self lookups anyOne withReceiver: t) resolve arguments.
			actuals := aType arguments.
			1
				to: (expecteds size min: actuals size)
				do: [ :i | 
					| expected actual |
					expected := expecteds at: i.
					actual := actuals at: i.
					expected >= actual
						ifFalse: [ aStream
								nextPut: (TypCheIncompatible node: (self inArgumentAt: i) expected: expected) ] ] ]
]

{ #category : #'*Typer-Checker' }
TypInfMessage >> typCheOn: aStream [
	| receiver |
	receiver := self receiver.
	(receiver canLookupMethod: self selector)
		ifTrue: [ self typCheArgumentsWithReceiver: receiver on: aStream ]
		ifFalse: [ (receiver asNonNullable canLookupMethod: self selector)
				ifTrue: [ aStream
						nextPut: (TypCheNullable node: self inReceiver message: 'receiver is nullable').
					self typCheArgumentsWithReceiver: receiver asNonNullable on: aStream ]
				ifFalse: [ aStream
						nextPut: (TypCheNoMethod node: self selector: self selector) ] ]
]
