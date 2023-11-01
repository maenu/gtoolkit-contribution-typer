Extension { #name : #Float }

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMethodKeywordBasicAtPut: aLookup root: anotherLookup [
	<typShaMethod: 'basicAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]
