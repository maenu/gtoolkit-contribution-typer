Class {
	#name : #TypCheIncompatibleTypeError,
	#superclass : #Error,
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
TypCheIncompatibleTypeError >> expected [
	<typTypeResultAs: 'TypType'>
	^ expected
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> expected: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	expected := anObject
]
