Class {
	#name : #TypGtCheckErrorAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'text',
		'color'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtCheckErrorAttribute >> color [
	<typTypeResultAs: 'Color'>
	^ color
]

{ #category : #accessing }
TypGtCheckErrorAttribute >> color: anObject [
	<typTypeArgument: 1 as: 'Color'>
	color := anObject
]

{ #category : #initialization }
TypGtCheckErrorAttribute >> initialize [
	<typTypeVariable: 'text' as: 'String<Character>'>
	<typTypeVariable: 'color' as: 'Color'>
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
						foreground: color;
						fontSize: 12) ]
]

{ #category : #accessing }
TypGtCheckErrorAttribute >> text [
	<typTypeResultAs: 'String<Character>'>
	^ text
]

{ #category : #accessing }
TypGtCheckErrorAttribute >> text: anObject [
	<typTypeArgument: 1 as: 'String<Character>'>
	text := anObject
]
