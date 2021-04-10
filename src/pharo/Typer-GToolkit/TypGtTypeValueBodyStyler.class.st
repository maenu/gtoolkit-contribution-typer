Class {
	#name : #TypGtTypeValueBodyStyler,
	#superclass : #TypGtTypeBodyStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitNode: aNode [
	super visitNode: aNode.
	aNode isValue ifTrue: [self styleValueNode: aNode]
]
