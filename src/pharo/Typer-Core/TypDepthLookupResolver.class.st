Class {
	#name : #TypDepthLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypDepthLookupResolver >> resolve: aLookup [
	| results |
	aLookup push: self.
	results := resolver resolve: aLookup.
	aLookup hasSuper
		ifTrue: [ results := results , (self resolve: aLookup copyAsSuper) ].
	^ results
]
