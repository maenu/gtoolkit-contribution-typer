Extension { #name : #TypInfAssignment }

{ #category : #'*Typer-Checker' }
TypInfAssignment >> typChe [
	| expected actual |
	expected := (self outAt: #next) type.
	actual := self type.
	expected >= actual
		ifFalse: [ TypCheIncompatible signal: self expected: expected ]
]
