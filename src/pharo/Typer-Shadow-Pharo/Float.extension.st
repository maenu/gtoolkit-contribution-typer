Extension { #name : #Float }

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMethodKeywordBasicAtPut: aLookup [
	<typShaMethod: 'basicAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]
