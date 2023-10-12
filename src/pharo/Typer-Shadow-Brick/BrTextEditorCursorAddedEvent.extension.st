Extension { #name : #BrTextEditorCursorAddedEvent }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditorCursorAddedEvent >> typShaMethodUnaryCursor: aLookup [
	<typShaMethod: 'cursor'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrTextEditorSingleCursor typAsType
]
