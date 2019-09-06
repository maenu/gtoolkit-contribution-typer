Class {
	#name : #TypLookupTypeResult,
	#superclass : #TypLookupResult,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypLookupTypeResult >> type [
	^ type
]

{ #category : #accessing }
TypLookupTypeResult >> type: anObject [
	type := anObject
]
