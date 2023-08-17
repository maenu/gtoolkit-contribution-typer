Extension { #name : #TestSuite }

{ #category : #'*Typer-Shadow-Pharo' }
TestSuite >> typShaMethodRun: aLookup [
	<typShaMethod: 'run:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {TestResult typAsType}
]
