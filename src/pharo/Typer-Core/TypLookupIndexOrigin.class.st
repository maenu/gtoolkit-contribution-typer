Class {
	#name : #TypLookupIndexOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'alternatives'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupIndexOrigin class >> alternatives: aCollection [
	^ self new
		initializeAlternatives: aCollection;
		yourself
]

{ #category : #accessing }
TypLookupIndexOrigin >> initializeAlternatives: aCollection [
	alternatives := aCollection
]
