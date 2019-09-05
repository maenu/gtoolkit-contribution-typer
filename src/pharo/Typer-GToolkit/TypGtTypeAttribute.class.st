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
		stencil: [ BrLabel new
				text: type printString;
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
						fontSize: 12);
				when: BlClickEvent do: [ :e | e target phlow spawnObject: type ];
				yourself ]
]

{ #category : #accessing }
TypGtTypeAttribute >> type_ [
	<typTypeResultAs: 'TypType'>
	^ type
]

{ #category : #accessing }
TypGtTypeAttribute >> type_: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	type := anObject
]
