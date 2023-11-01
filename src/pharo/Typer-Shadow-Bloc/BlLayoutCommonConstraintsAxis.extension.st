Extension { #name : #BlLayoutCommonConstraintsAxis }

{ #category : #'*Typer-Shadow-Bloc' }
BlLayoutCommonConstraintsAxis >> typShaMethodKeywordExact: aLookup root: anotherLookup [
	<typShaMethod: 'exact:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Number typAsType}
]
