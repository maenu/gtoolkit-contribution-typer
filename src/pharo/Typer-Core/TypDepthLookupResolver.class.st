Class {
	#name : #TypDepthLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypDepthLookupResolver >> canResolve: aLookup [
	^ (resolver canResolve: aLookup)
		or: [ aLookup hasSuper and: [ self canResolve: aLookup copyAsSuper ] ]
]

{ #category : #resolving }
TypDepthLookupResolver >> resolve: aLookup [
	| results result |
	self assert: [ self canResolve: aLookup ].
	result := resolver resolve: aLookup.
	results := OrderedCollection with: result.
	aLookup hasSuper
		ifTrue: [ results add: (self resolve: aLookup copyAsSuper) ].
	^ self reduce: results
]
