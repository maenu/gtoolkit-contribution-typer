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

{ #category : #invalidation }
TypCachingResolver >> invalidateOn: aClassOrMethodAnnouncement [

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
TypCachingResolver >> reset [
	super reset.
	cache removeAll
]

{ #category : #resolving }
TypCachingResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	^ cache at: aLookup ifAbsent: [ 
		  cache
			  at: aLookup
			  put: (TypUnknownType origin: (TypLookupOrigin lookup: aLookup));
			  at: aLookup put: (resolver resolve: aLookup) ]
]
