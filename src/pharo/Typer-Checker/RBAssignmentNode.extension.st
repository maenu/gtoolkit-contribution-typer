Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Checker' }
RBAssignmentNode >> typCheCheckCompatibility [
	| expected actual |
	expected := self variable typType.
	actual := self value typType.
	(expected isUnknown or: [ actual isUnknown ])
		ifTrue: [ ^ self ].
	expected >= actual
		ifTrue: [ ^ self ].
	(actual isFunction
		and: [ self value isBlock
				and: [ (self value body typSignalsAlways = true or: [ self value body lastIsReturn ])
						and: [ expected hasParamatersCompatibleWithThoseOf: actual ] ] ])
		ifTrue: [ ^ self ].
	TypCheIncompatibleTypeError new
		expected: expected;
		actual: actual;
		signal
]
