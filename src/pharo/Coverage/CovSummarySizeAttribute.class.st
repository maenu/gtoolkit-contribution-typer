Class {
	#name : #CovSummarySizeAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'summary'
	],
	#category : #'Coverage-GToolkit'
}

{ #category : #initialization }
CovSummarySizeAttribute >> initialize [
	super initialize.
	self
		beAppend;
		stencil: [ BrLabel new
				text: summary size asString;
				look:
					(BrGlamorousLabelLook new
						foreground: Color veryLightGray;
						fontSize: 10) ]
]

{ #category : #accessing }
CovSummarySizeAttribute >> summary [
	^ summary
]

{ #category : #accessing }
CovSummarySizeAttribute >> summary: anObject [
	summary := anObject
]
