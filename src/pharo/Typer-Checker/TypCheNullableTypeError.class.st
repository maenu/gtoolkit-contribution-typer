Class {
	#name : #TypCheNullableTypeError,
	#superclass : #Error,
	#instVars : [
		'type'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheNullableTypeError >> type [
	^ type
]

{ #category : #accessing }
TypCheNullableTypeError >> type: anObject [
	type := anObject
]
