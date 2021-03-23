Class {
	#name : #TypDepthLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypDepthLookupResolver >> resolveBasic: aLookup [
	| results |
	results := resolver resolve: aLookup.
	aLookup hasSuper
		ifTrue: [ results := results , (self resolve: aLookup copyAsSuper) ].
	^ results
]
