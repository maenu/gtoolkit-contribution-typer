Extension { #name : #BrLabel }

{ #category : #'*Typer-Shadow-Brick' }
BrLabel >> typShaMethodText: aLookup [
	<typShaMethod: 'text:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {{String typAsType.
					BlText typAsType} typAsType}
]
