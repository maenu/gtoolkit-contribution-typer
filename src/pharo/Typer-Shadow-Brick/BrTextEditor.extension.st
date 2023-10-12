Extension { #name : #BrTextEditor }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditor >> typShaMethodKeywordInvalidateTo: aLookup [
	<typShaMethod: 'invalidate:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditor >> typShaMethodKeywordUpdateTo: aLookup [
	<typShaMethod: 'update:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditor >> typShaMethodUnaryText: aLookup [
	<typShaMethod: 'text'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlText typAsType
]
