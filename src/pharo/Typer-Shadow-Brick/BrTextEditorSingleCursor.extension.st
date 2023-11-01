Extension { #name : #BrTextEditorSingleCursor }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditorSingleCursor >> typShaMethodUnaryPosition: aLookup root: anotherLookup [
	<typShaMethod: 'position'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]
