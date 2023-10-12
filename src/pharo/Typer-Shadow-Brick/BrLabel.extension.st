Extension { #name : #BrLabel }

{ #category : #'*Typer-Shadow-Brick' }
BrLabel >> typShaMethodKeywordText: aLookup [
	<typShaMethod: 'text:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{String typAsType.
					BlText typAsType} typAsType}
]
