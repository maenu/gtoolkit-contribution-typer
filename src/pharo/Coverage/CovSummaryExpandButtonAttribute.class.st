Class {
	#name : #CovSummaryExpandButtonAttribute,
	#superclass : #BrTextExpandButtonAttribute,
	#instVars : [
		'summary'
	],
	#category : #'Coverage-GToolkit'
}

{ #category : #initialization }
CovSummaryExpandButtonAttribute >> initialize [
	super initialize.
	self
		beAppend;
		attributesCreatingBlock: [ {(BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ | aContainer anObjectView |
					aContainer := BlElement new.
					aContainer
						look: BrShadowLook new;
						layout: BlLinearLayout vertical;
						margin: (BlInsets all: 20);
						background: Color white;
						constraintsDo: [ :c | 
							c textFlow pushLine.
							c horizontal matchParent.
							c vertical exact: 200 ].
					anObjectView := summary gtViewsFor: GtPhlowView empty.
					anObjectView asElementDo: [ :aViewElement | aContainer addChild: aViewElement ].
					aContainer ])} ]
]

{ #category : #accessing }
CovSummaryExpandButtonAttribute >> summary [
	^ summary
]

{ #category : #accessing }
CovSummaryExpandButtonAttribute >> summary: anObject [
	summary := anObject
]
