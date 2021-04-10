Class {
	#name : #TypDepthLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypDepthLookupResolver >> resolve: aLookup [
	| results result |
	aLookup push: self.
	result := resolver resolve: aLookup.
	results := OrderedCollection with: result.
	(result isUnknown and: [ aLookup hasSuper ])
		ifTrue: [ results add: (self resolve: aLookup copyAsSuper) ].
	^ self reduce: results
]
