Extension { #name : #BrTextEditorSingleCursor }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditorSingleCursor >> typShaMethodUnaryPosition: aLookup [
	<typShaMethod: 'position'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]
