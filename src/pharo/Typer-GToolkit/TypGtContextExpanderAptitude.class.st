Class {
	#name : #TypGtContextExpanderAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'label',
		'indicator'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtContextExpanderAptitude class >> indicator: aString [
	^ self new
		initializeIndicator: aString;
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
					text: (indicator asRopedText
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
TypGtContextExpanderAptitude >> initializeIndicator: aString [
	indicator := aString
]
