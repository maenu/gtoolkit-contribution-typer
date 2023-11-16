Extension { #name : #TypCheNullable }

{ #category : #'*Typer-Checker' }
TypCheNullable class >> node: aNode lookup: aLookup message: aString [
	^ self new
		node: aNode;
		lookup: aLookup;
		messageText: aString;
		yourself
]
