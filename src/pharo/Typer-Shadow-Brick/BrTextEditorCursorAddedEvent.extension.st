Extension { #name : #BrTextEditorCursorAddedEvent }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditorCursorAddedEvent >> typShaMethodUnaryCursor: aLookup root: anotherLookup [
	<typShaMethod: 'cursor'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrTextEditorSingleCursor typAsType
]
