Class {
	#name : #TypOrigin,
	#superclass : #Object,
	#instVars : [
		'origins'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypOrigin >> add: anOrigin [
	origins add: anOrigin
]

{ #category : #accessing }
TypOrigin >> initialize [
	super initialize.
	origins := OrderedCollection new
]
