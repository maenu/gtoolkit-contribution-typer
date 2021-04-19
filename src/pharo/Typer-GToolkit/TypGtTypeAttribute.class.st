Class {
	#name : #TypGtTypeAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'type'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #initialization }
TypGtTypeAttribute >> initialize [
	<typPraVariable: 'type' as: 'TypType'>
	super initialize.
	self
		beAppend;
		stencil: [ BrLabel new
				text: type printString asRopedText glamorousCodeFontAndSize;
				margin:
					(BlInsets
						top: -1
						right: 0
						bottom: 0
						left: 5);
				aptitude:
					(BrGlamorousLabelLook new
						foreground: Color gray;
						yourself);
				when: BlClickEvent do: [ :e | e target phlow spawnObject: type ];
				yourself ]
]

{ #category : #accessing }
TypGtTypeAttribute >> type_ [
	<typPraResult: 'TypType'>
	^ type
]

{ #category : #accessing }
TypGtTypeAttribute >> type_: anObject [
	<typPraArguments: 'TypType'>
	type := anObject
]
