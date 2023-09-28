Extension { #name : #TypInfAssignment }

{ #category : #'*Typer-Checker' }
TypInfAssignment >> typCheCheckCompatibility [
	| expected actual |
	expected := (self outAt: #next) type.
	actual := self type.
	expected isUnknown ifTrue: [ ^ self ].
	actual isUnknown ifTrue: [ ^ self ].
	expected >= actual ifTrue: [ ^ self ].
	(actual typCheHasArgumentsCompatibleWithThoseOf: actual) ifTrue: [ ^ self ].
	TypCheIncompatibleTypeError new
		expected: expected;
		actual: actual;
		signal
]
