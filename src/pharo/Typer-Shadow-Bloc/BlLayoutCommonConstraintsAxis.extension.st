Extension { #name : #BlLayoutCommonConstraintsAxis }

{ #category : #'*Typer-Shadow-Bloc' }
BlLayoutCommonConstraintsAxis >> typShaMethodKeywordExact: aLookup [
	<typShaMethod: 'exact:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Number typAsType}
]
