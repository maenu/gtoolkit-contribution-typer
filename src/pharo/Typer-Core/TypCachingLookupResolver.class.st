Class {
	#name : #TypCachingLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#instVars : [
		'cache'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #initialization }
TypCachingLookupResolver >> initialize [
	<typTypeVariable: 'resolver' as: 'TypLookupResolver'>
	<typTypeVariable: 'cache' as: 'Dictionary<TypLookup,SequenceableCollection<TypLookupResult>>'>
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
	^ cache
		at: aLookup
		ifAbsent: [ aLookup push: self.
			cache
				at: aLookup put: self unknown;
				at: aLookup put: (resolver resolve: aLookup) ]
]
