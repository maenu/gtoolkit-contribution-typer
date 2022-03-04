Class {
	#name : #TypGtValueStyler,
	#superclass : #TypGtDeclarationStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtValueStyler >> visitNode: aNode [

	super visitNode: aNode.
	aNode isValue ifFalse: [ ^ self ].
	aNode isAssignment ifTrue: [ ^ self ].
	aNode isLiteralNode ifTrue: [ ^ self ].
	self styleNode: aNode
]
