Class {
	#name : #TypGtTypeValueBodyStyler,
	#superclass : #TypGtTypeBodyStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitGlobalNode: aNode [
	super visitGlobalNode: aNode.
	self styleValueNode: aNode
]

{ #category : #visiting }
TypGtTypeValueBodyStyler >> visitNode: aNode [
	super visitNode: aNode.
	self styleValueNode: aNode
]
