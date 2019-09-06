Class {
	#name : #TypLookupResult,
	#superclass : #Object,
	#instVars : [
		'lookup',
		'resolvedBy',
		'resolver'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypLookupResult >> lookup [
	^ lookup
]

{ #category : #accessing }
TypLookupResult >> lookup: anObject [
	lookup := anObject
]

{ #category : #accessing }
TypLookupResult >> resolvedBy [
	^ resolvedBy
]

{ #category : #accessing }
TypLookupResult >> resolvedBy: anObject [
	resolvedBy := anObject
]

{ #category : #accessing }
TypLookupResult >> resolver [
	^ resolver
]

{ #category : #accessing }
TypLookupResult >> resolver: anObject [
	resolver := anObject
]
