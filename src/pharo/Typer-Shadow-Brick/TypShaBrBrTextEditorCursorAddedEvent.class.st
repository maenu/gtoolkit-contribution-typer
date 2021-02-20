Class {
	#name : #TypShaBrBrTextEditorCursorAddedEvent,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextEditorCursorAddedEvent class >> shadowedClass [
	^ BrTextEditorCursorAddedEvent class
]

{ #category : #accessing }
TypShaBrBrTextEditorCursorAddedEvent >> ___cursor [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BrTextEditorSingleCursor typAsType ];
		yourself
]
