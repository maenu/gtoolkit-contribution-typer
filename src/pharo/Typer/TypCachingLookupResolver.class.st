Class {
	#name : #TypCachingLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolver',
		'cache'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypCachingLookupResolver >> initialize [
	super initialize.
	cache := Dictionary new
]

{ #category : #initialization }
TypCachingLookupResolver >> reset [
	cache removeAll
]

{ #category : #accessing }
TypCachingLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: '!TypLookupResult'>
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
