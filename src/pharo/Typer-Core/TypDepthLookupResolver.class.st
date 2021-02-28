Class {
	#name : #TypDepthLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypDepthLookupResolver >> resolveBasic: aLookup [
	| results |
	results := (resolver resolve: aLookup) asOrderedCollection.
	aLookup hasSuper
		ifTrue: [ results addAll: (self resolve: aLookup copyAsSuper) ].
	^ results
]
