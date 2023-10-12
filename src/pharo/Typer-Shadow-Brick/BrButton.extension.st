Extension { #name : #BrButton }

{ #category : #'*Typer-Shadow-Brick' }
BrButton >> typShaMethodKeywordAction: aLookup [
	<typShaMethod: 'action:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Brick' }
BrButton >> typShaMethodKeywordIcon: aLookup [
	<typShaMethod: 'icon:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlElement typAsType}
]
