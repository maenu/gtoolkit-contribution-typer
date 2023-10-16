Extension { #name : #TypInfNode }

{ #category : #'*Typer-Checker' }
TypInfNode >> typCheErrors [
	^ (OrderedCollection streamContents: [ :s | self typCheOn: s ])
		sorted: [ :a :b | a priority < b priority ]
]

{ #category : #'*Typer-Checker' }
TypInfNode >> typCheOn: aStream [
	
]
