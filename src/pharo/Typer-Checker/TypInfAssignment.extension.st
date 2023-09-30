Extension { #name : #TypInfAssignment }

{ #category : #'*Typer-Checker' }
TypInfAssignment >> typChe [
	| expected actual |
	super typChe.
	expected := (self outAt: #next) type.
	actual := self type.
	expected >= actual
		ifFalse: [ TypCheIncompatible signal: self expected: expected ]
]
