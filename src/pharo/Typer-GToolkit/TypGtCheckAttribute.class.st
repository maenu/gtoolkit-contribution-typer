Class {
	#name : #TypGtCheckAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'subject',
		'color',
		'message',
		'node'
	],
	#category : #'Typer-GToolkit-Typer-GToolkit'
}

{ #category : #accessing }
TypGtCheckAttribute class >> node: aNode subject: anObject color: aColor message: aString [

	^ self new
		  initializeNode: aNode
		  subject: anObject
		  color: aColor
		  message: aString;
		  yourself
]

{ #category : #accessing }
TypGtCheckAttribute >> initialize [

	super initialize.
	self
		beAppend;
		stencil: [ 
			BlElement new
				aptitude: (BrGlamorousWithTooltipAptitude content: [ 
							 BrLabel new
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
				do: [ :e | e target phlow spawnObject: subject ];
				yourself ]
]

{ #category : #accessing }
TypGtCheckAttribute >> initializeNode: aNode subject: anObject color: aColor message: aString [

	node := aNode.
	subject := anObject.
	color := aColor.
	message := aString
]
