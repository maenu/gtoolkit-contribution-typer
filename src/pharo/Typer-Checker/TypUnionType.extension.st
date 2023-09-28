Extension { #name : #TypUnionType }

{ #category : #'*Typer-Checker' }
TypUnionType >> typCheHasArgumentsCompatibleWithThoseOf: aType [
	^ types allSatisfy: [ :t | t typCheHasArgumentsCompatibleWithThoseOf: aType ]
]
