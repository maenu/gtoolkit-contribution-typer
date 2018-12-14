Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Checker' }
RBAssignmentNode >> typCheCheckCompatibility [
	| expected actual |
	expected := self variable typType.
	actual := self value typType.
	expected >= actual
		ifFalse: [ TypCheIncompatibleTypeError new
				expected: expected;
				actual: actual;
				signal ]
]
