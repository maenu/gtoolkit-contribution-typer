Class {
	#name : #TypGtAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'type',
		'object'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #'as yet unclassified' }
TypGtAttribute class >> type: aType object: anObject [

	^ self new
		  initializeType: aType object: anObject;
		  yourself
]

{ #category : #initialization }
TypGtAttribute >> initialize [

	<typPraVariable: 'type' as: 'TypType'>
	super initialize.
	self
		beAppend;
		stencil: [ 
			BrLabel new
				text: type printString asRopedText glamorousCodeFontAndSize;
				margin: (BlInsets
						 top: -1
						 right: 0
						 bottom: 0
						 left: 5);
				aptitude: (BrGlamorousLabelAptitude new
						 foreground: Color gray;
						 yourself);
				when: BlClickEvent do: [ :e | e target phlow spawnObject: object ];
				yourself ]
]

{ #category : #initialization }
TypGtAttribute >> initializeType: aType object: anObject [

	type := aType.
	object := anObject
]
