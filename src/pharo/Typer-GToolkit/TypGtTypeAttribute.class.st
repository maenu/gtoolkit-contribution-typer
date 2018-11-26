Class {
	#name : #TypGtTypeAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'type'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #initialization }
TypGtTypeAttribute >> initialize [
	super initialize.
	self
		beAppend;
		stencil: [ | s |
			s := type printString.
			BrLabel new
				text: ':' , s;
				margin:
					(BlInsets
						top: 4
						right: 2
						bottom: 0
						left: 2);
				look:
					(BrGlamorousLabelLook new
						foreground: Color veryLightGray;
						fontSize: 12) ]
]

{ #category : #accessing }
TypGtTypeAttribute >> type [
	^ type
]

{ #category : #accessing }
TypGtTypeAttribute >> type: anObject [
	type := anObject
]
