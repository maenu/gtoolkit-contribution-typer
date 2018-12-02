Extension { #name : #String }

{ #category : #'*Typer' }
String >> typAsType [
	<typTypeResultAs: 'TypType'>
	^ self typAsTypes first
]

{ #category : #'*Typer' }
String >> typAsTypes [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ [ TypTypeParser parse: self ]
		on: SmaCCParserError
		do: [ {TypUnknownType instance} ]
]
