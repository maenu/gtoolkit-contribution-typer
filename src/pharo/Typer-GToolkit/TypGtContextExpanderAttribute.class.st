Class {
	#name : #TypGtContextExpanderAttribute,
	#superclass : #BrGlamorousTriangleExpanderTextAttribute,
	#instVars : [
		'element',
		'coderViewModel'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtContextExpanderAttribute >> coderViewModel [
	^ coderViewModel
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> coderViewModel: anObject [
	coderViewModel := anObject
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> doAffect: aTBrTextEditorTextualPiece in: anEditorElement [
	^ element := (super doAffect: aTBrTextEditorTextualPiece in: anEditorElement)
			addAptitude: (TypGtContextExpanderAptitude new
					coderViewModel: coderViewModel;
					yourself);
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
				stencil: [ coderViewModel ] ]
]

{ #category : #accessing }
TypGtContextExpanderAttribute >> onRequestExpandContext: anEvent [
	(anEvent contextChain includes: coderViewModel typGtContext)
		ifFalse: [ self isExpanded ifTrue: [ BlSpace simulateClickOn: element ].
			coderViewModel announcer announce: anEvent.
			^ self ].
	self isExpanded
		ifTrue: [ coderViewModel announcer announce: anEvent.
			^ self ].
	BlSpace simulateClickOn: element.
	coderViewModel announcer announce: anEvent
]
