Extension { #name : #BrGlamorousIcons }

{ #category : #'*Typer-Shadow-Brick' }
BrGlamorousIcons class >> typShaMethodUnaryBrowse: aLookup [
	<typShaMethod: 'browse'>
	^ CompiledMethod typAsFunctionTypeWithResult: Form typAsType
]

{ #category : #'*Typer-Shadow-Brick' }
BrGlamorousIcons class >> typShaMethodUnaryInspect: aLookup [
	<typShaMethod: 'inspect'>
	^ CompiledMethod typAsFunctionTypeWithResult: Form typAsType
]
