Class {
	#name : #TypGtDeclarationBodyStyler,
	#superclass : #TypGtBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtDeclarationBodyStyler >> visitArgumentNode: aNode [
	Halt once.
	super visitArgumentNode: aNode.
	(aNode parent isBlock or: [ aNode parent isSequence ])
		ifTrue: [ self styleValueNode: aNode ]
]
