Class {
	#name : #TypCheIncompatibleTypeError,
	#superclass : #TypCheError,
	#instVars : [
		'expected',
		'actual'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheIncompatibleTypeError >> actual [
	<typPraResult: 'TypType'>
	^ actual
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> actual: anObject [
	<typPraArguments: 'TypType'>
	actual := anObject
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> color [
	^ Color red
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> expected [
	<typPraResult: 'TypType'>
	^ expected
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> expected: anObject [
	<typPraArguments: 'TypType'>
	expected := anObject
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> messageText [

	messageText ifNil: [ 
		messageText := 'Expected {1}, but was {2}' format: { 
				               expected asString.
				               actual asString } ].
	^ super messageText
]

{ #category : #printing }
TypCheIncompatibleTypeError >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' expected '.
	expected printOn: aStream.
	aStream nextPutAll: ', actual '.
	actual printOn: aStream.
	
]
