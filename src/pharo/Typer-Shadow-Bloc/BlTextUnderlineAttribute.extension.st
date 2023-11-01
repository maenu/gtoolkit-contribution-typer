Extension { #name : #BlTextUnderlineAttribute }

{ #category : #'*Typer-Shadow-Bloc' }
BlTextUnderlineAttribute >> typShaMethodKeywordPaint: aLookup root: anotherLookup [
	<typShaMethod: 'paint:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Color typAsType.
					BlPaint typAsType} typAsType}
]
