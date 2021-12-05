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
TypCachingResolver >> invalidateOnClass: aClassAnnouncement [

	super invalidateOnClass: aClassAnnouncement.
	cache keysAndValuesRemove: [ :lookup :type | 
		(lookup invalidateOnClass: aClassAnnouncement) or: [ 
			type invalidateOnClass: aClassAnnouncement ] ]
]

{ #category : #invalidation }
TypCachingResolver >> invalidateOnMethod: aMethodAnnouncement [

	super invalidateOnMethod: aMethodAnnouncement.
	cache keysAndValuesRemove: [ :lookup :type | 
		(lookup invalidateOnMethod: aMethodAnnouncement) or: [ 
			type invalidateOnMethod: aMethodAnnouncement ] ]
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
