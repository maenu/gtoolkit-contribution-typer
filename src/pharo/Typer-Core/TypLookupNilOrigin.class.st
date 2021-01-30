Class {
	#name : #TypLookupNilOrigin,
	#superclass : #TypLookupOrigin,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupNilOrigin class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
TypLookupNilOrigin >> isNil [
	^ true
]
