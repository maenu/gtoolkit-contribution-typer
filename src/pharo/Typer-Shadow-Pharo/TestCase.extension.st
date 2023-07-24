Extension { #name : #TestCase }

{ #category : #'*Typer-Shadow-Pharo' }
TestCase class >> typShaMethodSuite: aLookup [
	<typShaMethod: 'suite'>
	^ CompiledMethod typAsFunctionTypeWithResult: TestSuite typAsType
]
