Extension { #name : #BrTextEditorCursorRemovedEvent }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditorCursorRemovedEvent >> typShaMethodCursor: aLookup [
	<typShaMethod: 'cursor'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrTextEditorSingleCursor typAsType
]
