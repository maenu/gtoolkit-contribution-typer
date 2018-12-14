Class {
	#name : #TypCheIncompatibleTypeError,
	#superclass : #Error,
	#instVars : [
		'expected',
		'actual'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheIncompatibleTypeError >> actual [
	^ actual
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> actual: anObject [
	actual := anObject
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> expected [
	^ expected
]

{ #category : #accessing }
TypCheIncompatibleTypeError >> expected: anObject [
	expected := anObject
]
