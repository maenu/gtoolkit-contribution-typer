Extension { #name : #SmaCCParser }

{ #category : #'*Typer-Shadow-SmaCC' }
SmaCCParser class >> typShaMethodKeywordParse: aLookup [
	<typShaMethod: 'parse:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {String typAsType}
]
