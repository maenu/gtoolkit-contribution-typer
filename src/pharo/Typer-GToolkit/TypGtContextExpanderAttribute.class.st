Class {
	#name : #TypGtContextExpanderAttribute,
	#superclass : #BrGlamorousTriangleExpanderTextAttribute,
	#instVars : [
		'context',
		'lookup'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtContextExpanderAttribute class >> lookup: aLookup context: aContext [
	^ self new
		initializeLookup: aLookup context: aContext;
		yourself
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> doAffect: aTBrTextEditorTextualPiece in: anEditorElement [
	^ (super doAffect: aTBrTextEditorTextualPiece in: anEditorElement)
		addAptitude: (TypGtContextExpanderAptitude indicator: (context typGtIndicator: lookup));
		yourself
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> initialize [
	super initialize.
	self
		attributesCreatingBlock: [ BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ context typGtAsCoder ] ]
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> initializeLookup: aLookup context: aContext [
	lookup := aLookup.
	context := aContext
]
