Class {
	#name : #TypShaClassDescriptionLookupResult,
	#superclass : #TypClassDescriptionLookupResult,
	#instVars : [
		'shadow'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaClassDescriptionLookupResult class >> shadow: anObject [
	^ self new
		initializeShadow: anObject;
		yourself
]

{ #category : #accessing }
TypShaClassDescriptionLookupResult >> initializeShadow: anObject [
	shadow := anObject
]

{ #category : #accessing }
TypShaClassDescriptionLookupResult >> type [
	^ shadow asType: originalLookup classDescription
]
