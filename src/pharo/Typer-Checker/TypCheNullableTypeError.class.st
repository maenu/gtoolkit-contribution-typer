Class {
	#name : #TypCheNullableTypeError,
	#superclass : #TypCheError,
	#instVars : [
		'type'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheNullableTypeError >> color [
	^ Color purple
]

{ #category : #accessing }
TypCheNullableTypeError >> type [
	<typPraResult: 'TypType'>
	^ type
]

{ #category : #accessing }
TypCheNullableTypeError >> type: anObject [
	<typPraArguments: 'TypType'>
	type := anObject
]
