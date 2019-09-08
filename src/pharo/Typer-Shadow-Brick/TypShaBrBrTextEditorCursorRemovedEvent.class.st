Class {
	#name : #TypShaBrBrTextEditorCursorRemovedEvent,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextEditorCursorRemovedEvent class >> shadowedClass [
	^ BrTextEditorCursorRemovedEvent class
]

{ #category : #accessing }
TypShaBrBrTextEditorCursorRemovedEvent >> ___cursor [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BrTextEditorSingleCursor typAsType ];
		yourself
]
