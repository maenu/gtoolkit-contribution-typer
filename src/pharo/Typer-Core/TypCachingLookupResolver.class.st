Class {
	#name : #TypCachingLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolver',
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
	cache removeAll
]

{ #category : #accessing }
TypCachingLookupResolver >> resolve: aLookup [
	^ cache at: aLookup ifAbsentPut: [ resolver resolve: aLookup ]
]

{ #category : #accessing }
TypCachingLookupResolver >> resolver [
	^ resolver
]

{ #category : #accessing }
TypCachingLookupResolver >> resolver: anObject [
	resolver := anObject
]
