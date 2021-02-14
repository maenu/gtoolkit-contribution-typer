Class {
	#name : #TypOrigin,
	#superclass : #Object,
	#instVars : [
		'origin'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypOrigin >> initialize [
	super initialize.
	origin := TypNilOrigin instance
]

{ #category : #accessing }
TypOrigin >> isNil [
	^ false
]

{ #category : #accessing }
TypOrigin >> origin [
	^ origin
]

{ #category : #accessing }
TypOrigin >> origin: anOrigin [
	origin := anOrigin
]
