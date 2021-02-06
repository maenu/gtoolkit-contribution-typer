Class {
	#name : #TypWrappingLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolver'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypWrappingLookupResolver class >> resolver: aResolver [
	^ self new
		initializeResolver: aResolver;
		yourself
]

{ #category : #accessing }
TypWrappingLookupResolver >> initializeResolver: aResolver [
	resolver := aResolver
]

{ #category : #accessing }
TypWrappingLookupResolver >> reset [
	super reset.
	resolver reset
]

{ #category : #accessing }
TypWrappingLookupResolver >> resolver [
	^ resolver
]

{ #category : #accessing }
TypWrappingLookupResolver >> resolver: aResolver [
	resolver := aResolver
]
