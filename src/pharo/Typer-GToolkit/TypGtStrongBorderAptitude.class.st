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

	| background border geometry |
	background := Color white.
	border := BlBorder paint: aColor width: 1.
	geometry := BlCircleGeometry new.
	self collapsed
		background: background;
		border: border";
		geometry: geometry".
	self default
		background: background;
		border: border";
		geometry: geometry".
	self deselected
		background: background;
		border: border";
		geometry: geometry".
	self disabled
		background: background;
		border: border";
		geometry: geometry".
	self enabled
		background: background;
		border: border";
		geometry: geometry".
	self expanded
		background: background;
		border: border";
		geometry: geometry".
	self focused
		background: background;
		border: border";
		geometry: geometry".
	self hovered
		background: background;
		border: border";
		geometry: geometry".
	self pressed
		background: background;
		border: border";
		geometry: geometry".
	self selected
		background: background;
		border: border";
		geometry: geometry".
	self unfocused
		background: background;
		border: border";
		geometry: geometry"
]
