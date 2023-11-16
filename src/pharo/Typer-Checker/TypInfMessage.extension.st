Extension { #name : #TypInfMessage }

{ #category : #'*Typer-Checker' }
TypInfMessage >> typCheArgumentsWithLookup: aLookup on: aStream [
	| expecteds actuals |
	expecteds := aLookup resolve arguments.
	actuals := aLookup arguments.
	1
		to: (expecteds size min: actuals size)
		do: [ :i | 
			| expected actual |
			expected := expecteds at: i.
			actual := actuals at: i.
			expected >= actual
				ifFalse: [ aStream
						nextPut: (TypCheIncompatible
								node: (self inArgumentAt: i)
								lookup: aLookup
								expected: expected) ] ]
]

{ #category : #'*Typer-Checker' }
TypInfMessage >> typCheOn: aStream [
	self lookups
		do: [ :l | 
			l canResolve
				ifTrue: [ self typCheArgumentsWithLookup: l on: aStream ]
				ifFalse: [ | nonNullable |
					nonNullable := l withReceiver: l receiver asNonNullable.
					nonNullable canResolve
						ifTrue: [ aStream
								nextPut: (TypCheNullable
										node: self inReceiver
										lookup: l
										message: 'receiver is nullable').
							self typCheArgumentsWithLookup: nonNullable on: aStream ]
						ifFalse: [ aStream nextPut: (TypCheNoMethod node: self lookup: l) ] ] ]
]
