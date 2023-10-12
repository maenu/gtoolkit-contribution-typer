Extension { #name : #TestCase }

{ #category : #'*Typer-Shadow-Pharo' }
TestCase class >> typShaMethodUnarySuite: aLookup [
	<typShaMethod: 'suite'>
	^ CompiledMethod typAsFunctionTypeWithResult: TestSuite typAsType
]
