Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Checker' }
RBReturnNode >> typCheCheckCompatibility [
	| expected actual |
	expected := self methodNode typTypeForResult.
	actual := self value typType.
	expected >= actual
		ifFalse: [ TypCheIncompatibleTypeError new
				expected: expected;
				actual: actual;
				signal ]
]
