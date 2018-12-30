Extension { #name : #TypType }

{ #category : #'*Typer-Checker' }
TypType >> typCheHasMethod: aSymbol [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeResultAs: 'Boolean'>
	^ self representsClass
		and: [ (self asClass lookupSelector: aSymbol) isNotNil ]
]
