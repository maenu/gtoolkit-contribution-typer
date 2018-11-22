Class {
	#name : #CovClassAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'class_'
	],
	#category : #'Coverage-GToolkit'
}

{ #category : #accessing }
CovClassAttribute >> class_ [
	^ class_
]

{ #category : #accessing }
CovClassAttribute >> class_: anObject [
	class_ := anObject
]

{ #category : #initialization }
CovClassAttribute >> initialize [
	super initialize.
	self
		beAppend;
		stencil: [ BrLabel new
				text: ':' , class_ printString;
				margin:
					(BlInsets
						top: 4
						right: 2
						bottom: 0
						left: 2);
				look:
					(BrGlamorousLabelLook new
						foreground: Color veryLightGray;
						fontSize: 12) ]
]
