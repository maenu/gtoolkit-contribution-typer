Extension { #name : #TypType }

{ #category : #'*Typer-Checker' }
TypType >> typCheHasMethod: aSymbol [
	^ self hasClass and: [ (self asClass lookupSelector: aSymbol) isNotNil ]
]
