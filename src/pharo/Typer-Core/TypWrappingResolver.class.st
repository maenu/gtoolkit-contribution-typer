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
TypWrappingResolver >> invalidateOnClass: aClassAnnouncement [

	super invalidateOnClass: aClassAnnouncement.
	resolver invalidateOnClass: aClassAnnouncement
]

{ #category : #invalidation }
TypWrappingResolver >> invalidateOnMethod: aMethodAnnouncement [

	super invalidateOnMethod: aMethodAnnouncement.
	resolver invalidateOnMethod: aMethodAnnouncement
]
