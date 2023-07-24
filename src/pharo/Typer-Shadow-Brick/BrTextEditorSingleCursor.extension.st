Extension { #name : #BrTextEditorSingleCursor }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditorSingleCursor >> typShaMethodPosition: aLookup [
	<typShaMethod: 'position'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]
