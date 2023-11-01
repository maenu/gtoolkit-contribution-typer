Extension { #name : #SmaCCParser }

{ #category : #'*Typer-Shadow-SmaCC' }
SmaCCParser class >> typShaMethodKeywordParse: aLookup root: anotherLookup [
	<typShaMethod: 'parse:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {String typAsType}
]
