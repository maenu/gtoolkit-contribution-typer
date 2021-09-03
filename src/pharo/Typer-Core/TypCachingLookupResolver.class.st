Class {
	#name : #TypCachingLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#instVars : [
		'cache'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypCachingLookupResolver >> canResolve: aLookup [
	^ cache
		at: aLookup
		ifPresent: [ true ]
		ifAbsent: [ resolver canResolve: aLookup ]
]

{ #category : #initialization }
TypCachingLookupResolver >> initialize [
	<typPraVariable: 'resolver' as: 'TypLookupResolver'>
	<typPraVariable: 'cache' as: 'Dictionary<TypLookup,SequenceableCollection<TypLookupResult>>'>
	super initialize.
	cache := Dictionary new
]

{ #category : #invalidation }
TypCachingLookupResolver >> invalidateOn: aClassOrMethodAnnouncement [

	super invalidateOn: aClassOrMethodAnnouncement.
	cache keysAndValuesRemove: [ :lookup :type | 
		| invalidate |
		invalidate := false.
		(aClassOrMethodAnnouncement typInvalidates: lookup) ifTrue: [ 
			invalidate := true ].
		(aClassOrMethodAnnouncement typInvalidates: type) ifTrue: [ 
			invalidate := true.
			type invalidate ].
		invalidate ]
]

{ #category : #initialization }
TypCachingLookupResolver >> reset [
	super reset.
	cache removeAll
]

{ #category : #resolving }
TypCachingLookupResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	^ cache at: aLookup ifAbsent: [ 
		  cache
			  at: aLookup
			  put:
				  (TypUnknownType origin:
						   (TypLookupCacheDefaultOrigin lookup: aLookup));
			  at: aLookup put: (resolver resolve: aLookup) ]
]
