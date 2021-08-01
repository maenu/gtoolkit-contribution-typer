Class {
	#name : #TypGtValueStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtValueStyler >> visitNode: aNode [

	aNode isValue ifTrue: [ self styleNode: aNode ].
	super visitNode: aNode
]
