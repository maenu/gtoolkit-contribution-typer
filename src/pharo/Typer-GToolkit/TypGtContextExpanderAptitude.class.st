Class {
	#name : #TypGtContextExpanderAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'coder'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtContextExpanderAptitude class >> coder: aCoder [
	^ self new
		initializeCoder: aCoder;
		yourself
]

{ #category : #accessing }
TypGtContextExpanderAptitude >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget clipChildren) with: [ false ];
		addChangeAddChildAs: #(content label)
			with: [ BrLabel new
					aptitude: BrGlamorousLabelAptitude;
					text: (coder coderModel typGtIndicator asRopedText
							glamorousCodeFont;
							fontSize: 8;
							foreground: Color black;
							yourself);
					constraintsDo: [ :c | c ignoreByLayout ];
					relocate: -1 @ -5;
					hFitContent;
					vFitContent;
					zIndex: 1;
					yourself ]
]

{ #category : #accessing }
TypGtContextExpanderAptitude >> initializeCoder: aCoder [
	coder := aCoder
]
