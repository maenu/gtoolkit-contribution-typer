Extension { #name : #BrTextEditorCursorRemovedEvent }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditorCursorRemovedEvent >> typShaMethodUnaryCursor: aLookup root: anotherLookup [
	<typShaMethod: 'cursor'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrTextEditorSingleCursor typAsType
]
