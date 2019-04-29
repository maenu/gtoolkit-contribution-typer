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
	<typTypeVariable: 'type' as: 'TypType'>
	super initialize.
	self
		beAppend;
		stencil: [ | s |
			s := type printString.
			BrLabel new
				text: s;
				margin:
					(BlInsets
						top: 1
						right: 0
						bottom: 0
						left: 5);
				look:
					(BrGlamorousLabelLook new
						foreground: Color gray;
						fontName: 'Courier New';
						fontSize: 12) ]
]

{ #category : #accessing }
TypGtTypeAttribute >> type [
	<typTypeResultAs: 'TypType'>
	^ type
]

{ #category : #accessing }
TypGtTypeAttribute >> type: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	type := anObject
]
