Class {
	#name : #TypWrappingLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolver'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #'instance creation' }
TypWrappingLookupResolver class >> resolver: aResolver [
	^ self new
		initializeResolver: aResolver;
		yourself
]

{ #category : #initialization }
TypWrappingLookupResolver >> initializeResolver: aResolver [
	resolver := aResolver
]

{ #category : #invalidation }
TypWrappingLookupResolver >> invalidateOn: aClassOrMethodAnnouncement [

	super invalidateOn: aClassOrMethodAnnouncement.
	resolver invalidateOn: aClassOrMethodAnnouncement
]

{ #category : #resetting }
TypWrappingLookupResolver >> reset [
	super reset.
	resolver reset
]
