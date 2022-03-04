Class {
	#name : #TypGtAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'type'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #'as yet unclassified' }
TypGtAttribute class >> type: aType [

	^ self new
		  initializeType: aType;
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
				text: type printString asRopedText glamorousCodeFontAndSmallSize;
				margin: (BlInsets
						 top: -1
						 right: 0
						 bottom: 0
						 left: 5);
				aptitude: (BrGlamorousLabelAptitude new
						 foreground: Color gray;
						 yourself);
				when: BlClickEvent do: [ :e | e target phlow spawnObject: type ];
				yourself ]
]

{ #category : #initialization }
TypGtAttribute >> initializeType: aType [

	type := aType
]
