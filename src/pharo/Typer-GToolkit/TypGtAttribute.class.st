Class {
	#name : #TypGtAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'node',
		'type'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #'as yet unclassified' }
TypGtAttribute class >> node: aNode [

	^ self node: aNode type: aNode type
]

{ #category : #'as yet unclassified' }
TypGtAttribute class >> node: aNode type: aType [

	^ self new
		  initializeNode: aNode type: aType;
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
				beMiniSize;
				hFitContent;
				vFitContent;
				margin: (BlInsets
						 top: 3.3
						 left: 2
						 bottom: 0
						 right: (shouldAppend
								  ifTrue: [ 0 ]
								  ifFalse: [ 2 ]));
				when: BlClickEvent do: [ :e | e target phlow spawnObject: node ];
				yourself ]
]

{ #category : #initialization }
TypGtAttribute >> initializeNode: aNode type: aType [

	node := aNode.
	type := aType
]

{ #category : #initialization }
TypGtAttribute >> initializeType: aType [

	type := aType
]
