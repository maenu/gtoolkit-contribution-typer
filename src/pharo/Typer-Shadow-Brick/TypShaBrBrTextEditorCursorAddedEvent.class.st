Class {
	#name : #TypShaBrBrTextEditorCursorAddedEvent,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextEditorCursorAddedEvent class >> shadowedClass [
	^ BrTextEditorCursorAddedEvent class
]

{ #category : #shadow }
TypShaBrBrTextEditorCursorAddedEvent >> mCursor: aLookup [
	<typShaMethod: 'cursor'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BrTextEditorSingleCursor typAsType
]
