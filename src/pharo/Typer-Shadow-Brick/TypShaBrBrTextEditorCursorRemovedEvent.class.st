Class {
	#name : #TypShaBrBrTextEditorCursorRemovedEvent,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextEditorCursorRemovedEvent class >> shadowedClass [
	^ BrTextEditorCursorRemovedEvent class
]

{ #category : #shadow }
TypShaBrBrTextEditorCursorRemovedEvent >> mCursor: aLookup [
	<typShaMethod: 'cursor'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrTextEditorSingleCursor typAsType
]
