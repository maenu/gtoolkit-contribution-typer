Extension { #name : #ClassDescription }

{ #category : #'*Typer-Core-Examples' }
ClassDescription >> typGtExampleValue: aSymbol [
	^ (self methodNamed: aSymbol) gtExampleValue
]
