Extension { #name : #BrGlamorousIcons }

{ #category : #'*Typer-Shadow-Brick' }
BrGlamorousIcons class >> typShaMethodBrowse: aLookup [
	<typShaMethod: 'browse'>
	^ CompiledMethod typAsFunctionTypeWithResult: Form typAsType
]

{ #category : #'*Typer-Shadow-Brick' }
BrGlamorousIcons class >> typShaMethodInspect: aLookup [
	<typShaMethod: 'inspect'>
	^ CompiledMethod typAsFunctionTypeWithResult: Form typAsType
]
