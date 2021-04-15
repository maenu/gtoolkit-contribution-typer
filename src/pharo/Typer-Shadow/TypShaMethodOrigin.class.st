Class {
	#name : #TypShaMethodOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'method'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaMethodOrigin class >> method: aMethod [
	^ self new
		initializeMethod: aMethod;
		yourself
]

{ #category : #accessing }
TypShaMethodOrigin >> initializeMethod: aMethod [
	method := aMethod
]

{ #category : #accessing }
TypShaMethodOrigin >> printOn: aStream [
	aStream
		nextPutAll: 'shadow ';
		nextPutAll: method methodClass name;
		nextPutAll: '>>'.
	method selector printOn: aStream
]
