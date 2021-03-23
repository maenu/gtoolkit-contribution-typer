Class {
	#name : #TypOrigin,
	#superclass : #Object,
	#instVars : [
		'origins',
		'method'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypOrigin >> add: anOrigin [
	origins add: anOrigin
]

{ #category : #accessing }
TypOrigin >> initialize [
	| context |
	super initialize.
	context := thisContext sender.
	[ (context receiver isKindOf: TypOrigin)
		or: [ context receiver isClass
				and: [ context receiver inheritsFrom: TypOrigin ] ] ]
		whileTrue: [ context := context sender ].
	method := context method.
	origins := OrderedCollection new
]
