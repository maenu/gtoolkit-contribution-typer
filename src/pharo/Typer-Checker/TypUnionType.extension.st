Extension { #name : #TypUnionType }

{ #category : #'*Typer-Checker' }
TypUnionType >> typCheHasMethod: aSymbol [
	^ types allSatisfy: [ :e | e typCheHasMethod: aSymbol ]
]
