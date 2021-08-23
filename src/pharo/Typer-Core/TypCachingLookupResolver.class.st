Class {
	#name : #TypCachingLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#instVars : [
		'cache'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
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

{ #category : #initialization }
TypCachingLookupResolver >> reset [
	super reset.
	cache removeAll
]

{ #category : #accessing }
TypCachingLookupResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	^ cache at: aLookup ifAbsent: [ 
		  cache
			  at: aLookup put: (TypUnknownType new
					   addOrigin: (TypLookupCacheDefaultOrigin lookup: aLookup);
					   yourself);
			  at: aLookup put: (resolver resolve: aLookup) ]
]
