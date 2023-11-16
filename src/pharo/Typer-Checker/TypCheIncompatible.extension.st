Extension { #name : #TypCheIncompatible }

{ #category : #'*Typer-Checker' }
TypCheIncompatible class >> node: aNode lookup: aLookup expected: aType [
	^ self new
		node: aNode;
		lookup: aLookup;
		expected: aType;
		yourself
]
