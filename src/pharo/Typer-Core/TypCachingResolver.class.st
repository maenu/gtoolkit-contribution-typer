Class {
	#name : #TypCachingResolver,
	#superclass : #TypWrappingResolver,
	#instVars : [
		'cache',
		'unknown'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypCachingResolver >> canResolve: aLookup [

	^ resolver canResolve: aLookup
]

{ #category : #initialization }
TypCachingResolver >> invalidate [
	super invalidate.
	cache removeAll
]

{ #category : #invalidation }
TypCachingResolver >> invalidateOnClassChange: aClassAnnouncement [

	super invalidateOnClassChange: aClassAnnouncement.
	cache keysAndValuesRemove: [ :lookup :type | 
		(lookup isAffectedByClassChange: aClassAnnouncement) or: [ 
			type isAffectedByClassChange: aClassAnnouncement ] ]
]

{ #category : #invalidation }
TypCachingResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	super invalidateOnMethodChange: aMethodAnnouncement.
	cache keysAndValuesRemove: [ :lookup :type | 
		(lookup isAffectedByMethodChange: aMethodAnnouncement) or: [ 
			type isAffectedByMethodChange: aMethodAnnouncement ] ]
]

{ #category : #resolving }
TypCachingResolver >> resolve: aLookup [

	<typEdge>
	self outgoingAt: aLookup ensure: TypUnknownType instance.
	^ resolver resolve: aLookup
]
