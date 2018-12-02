Extension { #name : #String }

{ #category : #'*Typer' }
String >> typAsType [
	^ self typAsTypes first
]

{ #category : #'*Typer' }
String >> typAsTypes [
	^ [ TypTypeParser parse: self ]
		on: SmaCCParserError
		do: [ {TypUnknownType instance} ]
]
