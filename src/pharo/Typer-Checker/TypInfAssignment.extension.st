Extension { #name : #TypInfAssignment }

{ #category : #'*Typer-Checker' }
TypInfAssignment >> typCheOn: aStream [
	| expected actual |
	expected := (self outAt: #next) type.
	actual := self type.
	expected >= actual
		ifFalse: [ aStream
				nextPut: (TypCheIncompatible
						node: self
						lookup: nil
						expected: expected) ]
]
