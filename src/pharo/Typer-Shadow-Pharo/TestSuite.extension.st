Extension { #name : #TestSuite }

{ #category : #'*Typer-Shadow-Pharo' }
TestSuite >> typShaMethodRun: aLookup [
	<typShaMethod: 'run:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {TestResult typAsType}
]
