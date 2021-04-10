Class {
	#name : #TypLookupOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'lookup'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupOrigin class >> lookup: aLookup [
	^ self new
		initializeLookup: aLookup;
		yourself
]

{ #category : #accessing }
TypLookupOrigin >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	^ anObject lookup = lookup
]

{ #category : #accessing }
TypLookupOrigin >> hash [
	^ super hash bitXor: lookup hash
]

{ #category : #accessing }
TypLookupOrigin >> initializeLookup: aLookup [
	lookup := aLookup
]

{ #category : #accessing }
TypLookupOrigin >> lookup [
	^ lookup
]

{ #category : #accessing }
TypLookupOrigin >> printOn: aStream [
	lookup printOn: aStream
]
