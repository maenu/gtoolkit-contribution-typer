Class {
	#name : #TypLookupOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'lookup'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupOrigin class >> lookup: aLookup [
	^ self new
		initializeLookup: aLookup;
		yourself
]

{ #category : #accessing }
TypLookupOrigin >> initializeLookup: aLookup [
	lookup := aLookup
]
