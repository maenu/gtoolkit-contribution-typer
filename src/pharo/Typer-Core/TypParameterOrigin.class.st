Class {
	#name : #TypParameterOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'type',
		'name'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypParameterOrigin class >> type: aType name: aString [
	^ self new
		initializeType: aType name: aString;
		yourself
]

{ #category : #accessing }
TypParameterOrigin >> initializeType: aType name: aString [
	type := aType.
	name := aString
]

{ #category : #accessing }
TypParameterOrigin >> printOn: aStream [
	type printOn: aStream.
	aStream nextPutAll: ' at: '.
	name printOn: aStream
]
