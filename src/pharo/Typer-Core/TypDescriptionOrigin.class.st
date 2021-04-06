Class {
	#name : #TypDescriptionOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'description'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypDescriptionOrigin class >> description: aString [
	^ self new
		initializeDescription: aString;
		yourself
]

{ #category : #accessing }
TypDescriptionOrigin >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	^ anObject description = description
]

{ #category : #accessing }
TypDescriptionOrigin >> description [
	^ description
]

{ #category : #accessing }
TypDescriptionOrigin >> hash [
	^ super hash bitXor: description hash
]

{ #category : #accessing }
TypDescriptionOrigin >> initializeDescription: aString [
	description := aString
]

{ #category : #accessing }
TypDescriptionOrigin >> printOn: aStream [
	description printOn: aStream
]
