Class {
	#name : #TypCheNullableTypeError,
	#superclass : #TypCheError,
	#instVars : [
		'type'
	],
	#category : #'Typer-Checker'
}

{ #category : #accessing }
TypCheNullableTypeError >> color [
	^ Color purple
]

{ #category : #accessing }
TypCheNullableTypeError >> type [
	<typTypeResultAs: 'TypType'>
	^ type
]

{ #category : #accessing }
TypCheNullableTypeError >> type: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	type := anObject
]
