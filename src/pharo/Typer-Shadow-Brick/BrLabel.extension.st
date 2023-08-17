Extension { #name : #BrLabel }

{ #category : #'*Typer-Shadow-Brick' }
BrLabel >> typShaMethodText: aLookup [
	<typShaMethod: 'text:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{String typAsType.
					BlText typAsType} typAsType}
]
