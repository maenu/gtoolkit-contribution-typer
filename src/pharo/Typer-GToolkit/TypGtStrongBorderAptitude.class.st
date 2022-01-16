Class {
	#name : #TypGtStrongBorderAptitude,
	#superclass : #BrStyleCommonAptitude,
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtStrongBorderAptitude class >> color: aColor [

	^ self new
		  initializeColor: aColor;
		  yourself
]

{ #category : #accessing }
TypGtStrongBorderAptitude >> initializeColor: aColor [

	| border |
	border := BlBorder paint: aColor width: 2.
	self default border: border.
	self focused border: border.
	self hovered border: border.
	self pressed border: border.
	self disabled border: border
]
