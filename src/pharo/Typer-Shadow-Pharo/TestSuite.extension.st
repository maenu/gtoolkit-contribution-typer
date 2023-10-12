Extension { #name : #TestSuite }

{ #category : #'*Typer-Shadow-Pharo' }
TestSuite >> typShaMethodKeywordRun: aLookup [
	<typShaMethod: 'run:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {TestResult typAsType}
]
