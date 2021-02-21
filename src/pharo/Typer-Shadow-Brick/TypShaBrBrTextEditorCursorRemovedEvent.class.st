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
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BrTextEditorSingleCursor typAsType ];
		yourself
]
