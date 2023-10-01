Class {
	#name : #TypGtCheAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'color',
		'message',
		'object'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtCheAttribute class >> object: anObject color: aColor message: aString [
	^ self new
		initializeObject: anObject
			color: aColor
			message: aString;
		yourself
]

{ #category : #accessing }
TypGtCheAttribute >> initialize [
	super initialize.
	self
		beAppend;
		stencil: [ BlElement new
				aptitude: (BrGlamorousWithTooltipAptitude
						content: [ BrLabel new
								aptitude: BrGlamorousLabelAptitude;
								text: message;
								yourself ]);
				margin: (BlInsets
						top: 0
						right: 0
						bottom: 0
						left: 3);
				size: 8 @ 8;
				background: color;
				geometry: BlEllipseGeometry new;
				when: BlClickEvent
					do: [ :e | 
						e target phlow
							spawnObject: (object size = 1 ifTrue: [ object first ] ifFalse: [ object ]) ];
				yourself ]
]

{ #category : #accessing }
TypGtCheAttribute >> initializeObject: anObject color: aColor message: aString [
	object := anObject.
	color := aColor.
	message := aString
]
