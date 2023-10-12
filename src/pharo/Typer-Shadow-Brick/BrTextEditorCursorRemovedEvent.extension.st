Extension { #name : #BrTextEditorCursorRemovedEvent }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditorCursorRemovedEvent >> typShaMethodUnaryCursor: aLookup [
	<typShaMethod: 'cursor'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrTextEditorSingleCursor typAsType
]
