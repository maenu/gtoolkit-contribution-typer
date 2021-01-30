Class {
	#name : #TypLookupResult,
	#superclass : #Object,
	#instVars : [
		'lookup'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupResult class >> lookup: aLookup [
	^ self new
		initializeLookup: aLookup;
		yourself
]

{ #category : #accessing }
TypLookupResult >> initializeLookup: aLookup [
	lookup := aLookup
]
