Class {
	#name : #TypGtCheckErrorAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'text'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #initialization }
TypGtCheckErrorAttribute >> initialize [
	super initialize.
	self
		beAppend;
		stencil: [ BrLabel new
				text: text;
				margin:
					(BlInsets
						top: 4
						right: 2
						bottom: 0
						left: 2);
				look:
					(BrGlamorousLabelLook new
						foreground: Color red;
						fontSize: 12) ]
]

{ #category : #accessing }
TypGtCheckErrorAttribute >> text [
	^ text
]

{ #category : #accessing }
TypGtCheckErrorAttribute >> text: anObject [
	text := anObject
]
