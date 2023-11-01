Extension { #name : #BrGlamorousIcons }

{ #category : #'*Typer-Shadow-Brick' }
BrGlamorousIcons class >> typShaMethodUnaryBrowse: aLookup root: anotherLookup [
	<typShaMethod: 'browse'>
	^ CompiledMethod typAsFunctionTypeWithResult: Form typAsType
]

{ #category : #'*Typer-Shadow-Brick' }
BrGlamorousIcons class >> typShaMethodUnaryInspect: aLookup root: anotherLookup [
	<typShaMethod: 'inspect'>
	^ CompiledMethod typAsFunctionTypeWithResult: Form typAsType
]
