Class {
	#name : #TypDepthFirstResolver,
	#superclass : #TypResolver,
	#instVars : [
		'resolver'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #'as yet unclassified' }
TypDepthFirstResolver class >> resolver: aResolver [

	^ self new
		  initializeResolver: aResolver;
		  yourself
]

{ #category : #resolving }
TypDepthFirstResolver >> canResolve: aLookup [
	^ (resolver canResolve: aLookup)
		or: [ aLookup hasSuper and: [ self canResolve: aLookup asSuper ] ]
]

{ #category : #initialization }
TypDepthFirstResolver >> initializeResolver: aResolver [

	resolver := aResolver.
	self outgoingAt: #resolver put: resolver
]

{ #category : #invalidation }
TypDepthFirstResolver >> invalidate [
	super invalidate.
	resolver invalidate
]

{ #category : #invalidation }
TypDepthFirstResolver >> invalidateOnClassChange: aClassAnnouncement [

	super invalidateOnClassChange: aClassAnnouncement.
	resolver invalidateOnClassChange: aClassAnnouncement
]

{ #category : #invalidation }
TypDepthFirstResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	super invalidateOnMethodChange: aMethodAnnouncement.
	resolver invalidateOnMethodChange: aMethodAnnouncement
]

{ #category : #accessing }
TypDepthFirstResolver >> printOn: aStream [

	aStream nextPutAll: '↓'.
	resolver printOn: aStream
]

{ #category : #resolving }
TypDepthFirstResolver >> resolve: aLookup [

	<typEdge>
	self assert: [ self canResolve: aLookup ].
	^ (resolver canResolve: aLookup)
		  ifTrue: [ resolver resolve: aLookup ]
		  ifFalse: [ self resolve: aLookup asSuper ]
]
