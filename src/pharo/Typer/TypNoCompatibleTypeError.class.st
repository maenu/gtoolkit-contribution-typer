Class {
	#name : #TypNoCompatibleTypeError,
	#superclass : #Error,
	#instVars : [
		'cause'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypNoCompatibleTypeError >> cause [
	^ cause
]

{ #category : #accessing }
TypNoCompatibleTypeError >> cause: anObject [
	cause := anObject
]
