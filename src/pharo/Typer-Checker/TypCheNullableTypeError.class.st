Class {
	#name : #TypCheNullableTypeError,
	#superclass : #Error,
	#instVars : [
		'type'
	],
	#category : #'Typer-Checker'
}

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
