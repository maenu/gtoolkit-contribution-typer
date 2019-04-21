Class {
	#name : #TypGtTyperStyler,
	#superclass : #GtCoderBodyStyler,
	#instVars : [
		'coder'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtTyperStyler >> coder [
	^ coder
]

{ #category : #accessing }
TypGtTyperStyler >> coder: anObject [
	coder := anObject
]

{ #category : #private }
TypGtTyperStyler >> style: aText ast: anAst [
	anAst typIsTyped
		ifTrue: [ ^ self ].
	coder rbAST typType
]
