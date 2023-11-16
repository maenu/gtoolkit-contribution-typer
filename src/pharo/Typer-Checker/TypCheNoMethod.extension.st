Extension { #name : #TypCheNoMethod }

{ #category : #'*Typer-Checker' }
TypCheNoMethod class >> node: aNode lookup: aLookup [
	^ self new
		node: aNode;
		lookup: aLookup;
		yourself
]
