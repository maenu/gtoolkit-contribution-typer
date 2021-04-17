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
	| lookup types |
	self assert: [ self canResolve: aLookup ].
	types := OrderedCollection new.
	lookup := aLookup.
	(resolver canResolve: lookup)
		ifTrue: [ types add: (resolver resolve: lookup) ].
	[ lookup hasSuper ]
		whileTrue: [ lookup := lookup copyAsSuper.
			(resolver canResolve: lookup)
				ifTrue: [ types add: (resolver resolve: lookup) ] ].
	^ self reduce: types
]
