Class {
	#name : #TypGtDeclarationBodyStyler,
	#superclass : #TypGtBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtDeclarationBodyStyler >> visitArgumentNode: aNode [
	super visitArgumentNode: aNode.
	(aNode parent isBlock or: [ aNode parent isSequence ])
		ifTrue: [ self styleValueNode: aNode ]
]
