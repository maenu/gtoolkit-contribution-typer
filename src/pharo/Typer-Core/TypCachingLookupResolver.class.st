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
	^ cache
		at: aLookup
		ifAbsent: [ cache
				at: aLookup put: self unknown;
				at: aLookup put: (resolver resolve: aLookup) ]
]
