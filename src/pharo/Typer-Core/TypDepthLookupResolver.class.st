Class {
	#name : #TypDepthLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypDepthLookupResolver >> resolve: aLookup [
	| results |
	aLookup push: self.
	results := OrderedCollection with: (resolver resolve: aLookup).
	aLookup hasSuper
		ifTrue: [ results add: (self resolve: aLookup copyAsSuper) ].
	^ self reduce: results
]
