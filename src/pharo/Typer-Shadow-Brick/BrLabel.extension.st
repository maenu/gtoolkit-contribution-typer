Extension { #name : #BrLabel }

{ #category : #'*Typer-Shadow-Brick' }
BrLabel >> typShaMethodKeywordText: aLookup root: anotherLookup [
	<typShaMethod: 'text:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{String typAsType.
					BlText typAsType} typAsType}
]
