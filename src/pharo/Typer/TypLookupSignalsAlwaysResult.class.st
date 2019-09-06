Class {
	#name : #TypLookupSignalsAlwaysResult,
	#superclass : #TypLookupResult,
	#instVars : [
		'signalsAlways'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypLookupSignalsAlwaysResult >> signalsAlways [
	^ signalsAlways
]

{ #category : #accessing }
TypLookupSignalsAlwaysResult >> signalsAlways: anObject [
	signalsAlways := anObject
]
