Extension { #name : #BrTextEditor }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditor >> typShaMethodKeywordInvalidateTo: aLookup root: anotherLookup [
	<typShaMethod: 'invalidate:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditor >> typShaMethodKeywordUpdateTo: aLookup root: anotherLookup [
	<typShaMethod: 'update:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditor >> typShaMethodUnaryText: aLookup root: anotherLookup [
	<typShaMethod: 'text'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlText typAsType
]
