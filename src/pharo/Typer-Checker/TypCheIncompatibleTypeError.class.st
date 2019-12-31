Class {
	#name : #TypCheIncompatibleTypeError,
	#superclass : #TypCheError,
	#instVars : [
		'expected',
		'actual'
	],
	#category : #'Typer-Checker'
}

{ #category : #accessing }
TypCheIncompatibleTypeError >> actual [
	<typTypeResultAs: 'TypType'>
	^ actual
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> actual: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	actual := anObject
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> color [
	^ Color red
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> expected [
	<typTypeResultAs: 'TypType'>
	^ expected
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> expected: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	expected := anObject
]

{ #category : #printing }
TypCheIncompatibleTypeError >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' expected '.
	expected printOn: aStream.
	aStream nextPutAll: ', actual '.
	actual printOn: aStream.
	
]
