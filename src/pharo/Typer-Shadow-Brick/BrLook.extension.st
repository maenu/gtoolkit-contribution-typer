Extension { #name : #BrLook }

{ #category : #'*Typer-Shadow-Brick' }
BrLook class >> typShaMethodBinary26: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrLook typAsType
		arguments: {{BrLook typAsType.
					BrLook class typAsType} typAsType}
]
