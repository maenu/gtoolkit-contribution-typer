Class {
	#name : #TypShaClassDescriptionLookupResult,
	#superclass : #TypTypeLookupResult,
	#instVars : [
		'shadow'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaClassDescriptionLookupResult class >> lookup: aLookup shadow: anObject [
	^ self new
		initializeLookup: aLookup;
		initializeShadow: anObject;
		yourself
]

{ #category : #accessing }
TypShaClassDescriptionLookupResult >> initializeShadow: anObject [
	shadow := anObject
]

{ #category : #accessing }
TypShaClassDescriptionLookupResult >> type [
	^ shadow asType: lookup root classDescription
]
