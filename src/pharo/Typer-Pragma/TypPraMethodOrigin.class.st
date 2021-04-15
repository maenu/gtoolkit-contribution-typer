Class {
	#name : #TypPraMethodOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'method'
	],
	#category : #'Typer-Pragma'
}

{ #category : #'instance creation' }
TypPraMethodOrigin class >> method: aMethod [
	^ self new
		initializeMethod: aMethod;
		yourself
]

{ #category : #accessing }
TypPraMethodOrigin >> initializeMethod: aMethod [
	method := aMethod
]

{ #category : #accessing }
TypPraMethodOrigin >> printOn: aStream [
	aStream
		nextPutAll: 'pragmas ';
		nextPutAll: method methodClass name;
		nextPutAll: '>>'.
	method selector printOn: aStream
]
