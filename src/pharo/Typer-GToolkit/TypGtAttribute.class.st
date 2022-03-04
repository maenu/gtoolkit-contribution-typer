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
				aptitude: (BrGlamorousLabelAptitude new
						 foreground: Color gray;
						 yourself);
				text: type printString asRopedText glamorousCodeFont;
				beTinySize;
				hFitContent;
				vFitContent;
				padding: (BlInsets
						 top: 0
						 left: 2
						 bottom: 0
						 right: 2);
				margin: (BlInsets
						 top: 1
						 left: 0
						 bottom: -8
						 right: 0);
				when: BlClickEvent do: [ :e | e target phlow spawnObject: type ];
				yourself ]
]

{ #category : #initialization }
TypGtAttribute >> initializeType: aType [

	type := aType
]
