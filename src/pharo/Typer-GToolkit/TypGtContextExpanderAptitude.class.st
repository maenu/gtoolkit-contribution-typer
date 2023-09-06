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
							bold;
							fontSize: 8;
							foreground: Color black;
							yourself);
					margin: (BlInsets
							top: 0
							left: 5
							bottom: 10
							right: 0);
					constraintsDo: [ :c | 
						c ignoreByLayout.
						c vertical exact: -17 ];
					hFitContent;
					vFitContent;
					zIndex: 1;
					yourself ]
]

{ #category : #accessing }
TypGtContextExpanderAptitude >> initializeIndicator: aString [
	indicator := aString
]
