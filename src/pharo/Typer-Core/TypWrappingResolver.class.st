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
TypWrappingResolver >> invalidate [
	super invalidate.
	resolver invalidate
]

{ #category : #invalidation }
TypWrappingResolver >> invalidateOnClassChange: aClassAnnouncement [

	super invalidateOnClassChange: aClassAnnouncement.
	resolver invalidateOnClassChange: aClassAnnouncement
]

{ #category : #invalidation }
TypWrappingResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	super invalidateOnMethodChange: aMethodAnnouncement.
	resolver invalidateOnMethodChange: aMethodAnnouncement
]