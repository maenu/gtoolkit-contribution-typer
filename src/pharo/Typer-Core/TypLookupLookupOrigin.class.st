Class {
	#name : #TypLookupLookupOrigin,
	#superclass : #TypLookupOrigin,
	#instVars : [
		'lookup'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupLookupOrigin class >> lookup: aLookup [
	^ self new
		initializeLookup: aLookup;
		yourself
]

{ #category : #accessing }
TypLookupLookupOrigin >> initializeLookup: aLookup [
	lookup := aLookup
]

{ #category : #accessing }
TypLookupLookupOrigin >> lookup [
	^ lookup
]
