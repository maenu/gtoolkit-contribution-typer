Class {
	#name : #TypCachingResolver,
	#superclass : #TypWrappingResolver,
	#instVars : [
		'cache'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypCachingResolver >> canResolve: aLookup [
	^ cache
		at: aLookup
		ifPresent: [ true ]
		ifAbsent: [ resolver canResolve: aLookup ]
]

{ #category : #initialization }
TypCachingResolver >> initialize [
	<typPraVariable: 'resolver' as: 'TypLookupResolver'>
	<typPraVariable: 'cache' as: 'Dictionary<TypLookup,SequenceableCollection<TypLookupResult>>'>
	super initialize.
	cache := Dictionary new
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

	self assert: [ self canResolve: aLookup ].
	self addDependent: aLookup label: #resolve:.
	^ cache at: aLookup ifAbsent: [ 
		  cache
			  at: aLookup
			  put: (self addDependent: TypUnknownType new label: #default);
			  at: aLookup put: (resolver resolve: aLookup) ]
]
