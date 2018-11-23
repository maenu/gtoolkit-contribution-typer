Class {
	#name : #CovSummaryClassAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'summary'
	],
	#category : #'Coverage-GToolkit'
}

{ #category : #initialization }
CovSummaryClassAttribute >> initialize [
	super initialize.
	self
		beAppend;
		stencil: [ | s |
			s := [ summary inferredClass ]
				on: NoInferrableClassError
				do: [ nil ].
			BrLabel new
				text: ':' , s printString;
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

{ #category : #accessing }
CovSummaryClassAttribute >> summary [
	^ summary
]

{ #category : #accessing }
CovSummaryClassAttribute >> summary: anObject [
	summary := anObject
]
