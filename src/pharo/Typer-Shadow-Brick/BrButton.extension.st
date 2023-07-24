Extension { #name : #BrButton }

{ #category : #'*Typer-Shadow-Brick' }
BrButton >> typShaMethodAction: aLookup [
	<typShaMethod: 'action:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Brick' }
BrButton >> typShaMethodIcon: aLookup [
	<typShaMethod: 'icon:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlElement typAsType}
]
