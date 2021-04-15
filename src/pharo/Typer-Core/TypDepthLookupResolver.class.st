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
	| results lookup |
	self assert: [ self canResolve: aLookup ].
	results := OrderedCollection new.
	lookup := aLookup.
	(resolver canResolve: lookup)
		ifTrue: [ results add: (resolver resolve: lookup) ].
	[ lookup hasSuper ]
		whileTrue: [ lookup := lookup copyAsSuper.
			(resolver canResolve: lookup)
				ifTrue: [ results add: (resolver resolve: lookup) ] ].
	^ self reduce: results
]
