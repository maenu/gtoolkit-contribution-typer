Extension { #name : #BrTextEditor }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditor >> typShaMethodInvalidateTo: aLookup [
	<typShaMethod: 'invalidate:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditor >> typShaMethodText: aLookup [
	<typShaMethod: 'text'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlText typAsType
]

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditor >> typShaMethodUpdateTo: aLookup [
	<typShaMethod: 'update:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Integer typAsType.
				Integer typAsType}
]
