Extension { #name : #TestCase }

{ #category : #'*Typer-Shadow-Pharo' }
TestCase class >> typShaMethodUnarySuite: aLookup root: anotherLookup [
	<typShaMethod: 'suite'>
	^ CompiledMethod typAsFunctionTypeWithResult: TestSuite typAsType
]
