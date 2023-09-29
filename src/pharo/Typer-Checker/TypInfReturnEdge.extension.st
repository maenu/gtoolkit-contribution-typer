Extension { #name : #TypInfReturnEdge }

{ #category : #'*Typer-Checker' }
TypInfReturnEdge >> typCheCheckReturnCompatibility [
	| expected actual |
	expected := target typCheMethod result.
	actual := origin type.
	expected isUnknown ifTrue: [ ^ self ].
	actual isUnknown ifTrue: [ ^ self ].
	(expected isNullable and: [ actual isNil ]) ifTrue: [ ^ self ].
	expected >= actual asNonNullable ifTrue: [ ^ self ].
	(expected typCheHasArgumentsCompatibleWithThoseOf: actual) ifTrue: [ ^ self ].
	TypCheIncompatibleTypeError new
		expected: expected;
		actual: actual;
		signal
]

{ #category : #'*Typer-Checker' }
TypInfReturnEdge >> typCheCheckReturnNullables [
	| expected actual |
	expected := target typCheMethod result.
	actual := origin type.
	expected isUnknown ifTrue: [ ^ self ].
	actual isUnknown ifTrue: [ ^ self ].
	actual isNullable ifFalse: [ ^ self ].
	expected >= actual ifTrue: [ ^ self ].
	TypCheNullableTypeError new
		type: actual;
		signal
]
