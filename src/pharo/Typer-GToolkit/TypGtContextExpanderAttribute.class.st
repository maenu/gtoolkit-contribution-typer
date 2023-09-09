Class {
	#name : #TypGtContextExpanderAttribute,
	#superclass : #BrGlamorousTriangleExpanderTextAttribute,
	#instVars : [
		'coder'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtContextExpanderAttribute class >> coder: aCoder [
	^ self new
		initializeCoder: aCoder;
		yourself
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> doAffect: aTBrTextEditorTextualPiece in: anEditorElement [
	^ (super doAffect: aTBrTextEditorTextualPiece in: anEditorElement)
		addAptitude: (TypGtContextExpanderAptitude coder: coder);
		yourself
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> initialize [
	super initialize.
	self
		attributesCreatingBlock: [ BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ coder ] ]
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> initializeCoder: aCoder [
	coder := aCoder
]
