Extension { #name : #TypUnionType }

{ #category : #'*Typer-Checker' }
TypUnionType >> typCheHasMethod: aSymbol [
	^ (types reject: #isNil) allSatisfy: [ :e | e typCheHasMethod: aSymbol ]
]
