Class {
	#name : #TypLookupAlternativeOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'alternatives'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupAlternativeOrigin class >> alternatives: aCollection [
	^ self new
		initializeAlternatives: aCollection;
		yourself
]

{ #category : #accessing }
TypLookupAlternativeOrigin >> initializeAlternatives: aCollection [
	alternatives := aCollection
]
