Class {
	#name : #TypDescriptionOrigin,
	#superclass : #Object,
	#instVars : [
		'description'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypDescriptionOrigin class >> description: aString [
	^ self new
		initializeDescription: aString;
		yourself
]

{ #category : #accessing }
TypDescriptionOrigin >> initializeDescription: aString [
	description := aString
]

{ #category : #accessing }
TypDescriptionOrigin >> printOn: aStream [
	description printOn: aStream
]
