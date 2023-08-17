Extension { #name : #BlTextUnderlineAttribute }

{ #category : #'*Typer-Shadow-Bloc' }
BlTextUnderlineAttribute >> typShaMethodPaint: aLookup [
	<typShaMethod: 'paint:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Color typAsType.
					BlPaint typAsType} typAsType}
]
