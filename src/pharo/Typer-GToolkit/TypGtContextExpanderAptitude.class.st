Class {
	#name : #TypGtContextExpanderAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'coderViewModel'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtContextExpanderAptitude >> coderViewModel [
	^ coderViewModel
]

{ #category : #accessing }
TypGtContextExpanderAptitude >> coderViewModel: anObject [
	coderViewModel := anObject
]

{ #category : #accessing }
TypGtContextExpanderAptitude >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget clipChildren) with: [ false ];
		addChangeAddChildAs: #(content label)
			with: [ BrLabel new
					aptitude: BrGlamorousLabelAptitude;
					text: (coderViewModel coderModel typGtIndicator asRopedText
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
