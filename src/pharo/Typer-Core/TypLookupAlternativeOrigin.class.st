Class {
	#name : #TypLookupAlternativeOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'alternatives'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupAlternativeOrigin class >> alternatives: aCollection [
	^ self new
		initializeAlternatives: aCollection;
		yourself
]

{ #category : #accessing }
TypLookupAlternativeOrigin >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	^ anObject alternatives = alternatives
]

{ #category : #accessing }
TypLookupAlternativeOrigin >> alternatives [
	^ alternatives
]

{ #category : #accessing }
TypLookupAlternativeOrigin >> hash [
	^ super hash bitXor: alternatives hash
]

{ #category : #accessing }
TypLookupAlternativeOrigin >> initializeAlternatives: aCollection [
	alternatives := aCollection
]

{ #category : #accessing }
TypLookupAlternativeOrigin >> printOn: aStream [
	aStream
		nextPut: ${;
		nextPutAll: (' ' join: (alternatives collect: #asString));
		nextPut: $}
]
