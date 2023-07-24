Extension { #name : #BrTextEditorCursorAddedEvent }

{ #category : #'*Typer-Shadow-Brick' }
BrTextEditorCursorAddedEvent >> typShaMethodCursor: aLookup [
	<typShaMethod: 'cursor'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrTextEditorSingleCursor typAsType
]
