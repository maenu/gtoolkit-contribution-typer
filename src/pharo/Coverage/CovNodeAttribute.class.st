Class {
	#name : #CovNodeAttribute,
	#superclass : #BrTextAdornmentDynamicAttribute,
	#instVars : [
		'node'
	],
	#category : #'Coverage-GToolkit'
}

{ #category : #initialization }
CovNodeAttribute >> initialize [
	super initialize.
	self
		beAppend;
		stencil: [ BrLabel new
				text: '|' , node printString;
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
CovNodeAttribute >> node [
	^ node
]

{ #category : #accessing }
CovNodeAttribute >> node: anObject [
	node := anObject
]
