Class {
	#name : #TypWrappingResolver,
	#superclass : #TypResolver,
	#instVars : [
		'resolver'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #'instance creation' }
TypWrappingResolver class >> resolver: aResolver [
	^ self new
		initializeResolver: aResolver;
		yourself
]

{ #category : #initialization }
TypWrappingResolver >> initializeResolver: aResolver [
	resolver := aResolver
]

{ #category : #invalidation }
TypWrappingResolver >> invalidateOn: aClassOrMethodAnnouncement [

	super invalidateOn: aClassOrMethodAnnouncement.
	resolver invalidateOn: aClassOrMethodAnnouncement
]

{ #category : #resetting }
TypWrappingResolver >> reset [
	super reset.
	resolver reset
]
