Class {
	#name : #TypGtContextExpanderAttribute,
	#superclass : #BrGlamorousTriangleExpanderTextAttribute,
	#instVars : [
		'coder',
		'element'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtContextExpanderAttribute class >> coder: aCoder in: anotherCoder [
	^ self new
		initializeCoder: aCoder in: anotherCoder;
		yourself
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> coder [
	^ coder
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> context [
	^ coder coderModel typGtContext
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> doAffect: aTBrTextEditorTextualPiece in: anEditorElement [
	^ element := (super doAffect: aTBrTextEditorTextualPiece in: anEditorElement)
			addAptitude: (TypGtContextExpanderAptitude coder: coder);
			yourself
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> element [
	^ element
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
TypGtContextExpanderAttribute >> initializeCoder: aCoder in: anotherCoder [
	coder := aCoder.
	anotherCoder announcer weak
		when: TypGtExpandContextRequest
		send: #onRequestExpandContext:
		to: self
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> onRequestExpandContext: anEvent [
	(anEvent contextChain includes: coder coderModel typGtContext)
		ifFalse: [ self isExpanded ifTrue: [ BlSpace simulateClickOn: element ].
			coder announcer announce: anEvent.
			^ self ].
	self isExpanded
		ifTrue: [ coder announcer announce: anEvent.
			^ self ].
	BlSpace simulateClickOn: element.
	coder announcer announce: anEvent
]
