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
	cache := Dictionary new  "typParameters TypLookup,SequenceableCollection<TypLookupResult>"
]

{ #category : #initialization }
TypCachingLookupResolver >> reset [
	super reset.
	cache removeAll
]

{ #category : #accessing }
TypCachingLookupResolver >> resolveBasic: aLookup [
	^ cache
		at: aLookup
		ifAbsent: [ cache at: aLookup put: #().
			cache at: aLookup put: (resolver resolve: aLookup) ]
]
