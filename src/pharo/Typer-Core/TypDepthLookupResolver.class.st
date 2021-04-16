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
	self assert: [ self canResolve: aLookup ].
	(resolver canResolve: aLookup)
		ifTrue: [ ^ resolver resolve: aLookup ].
	^ self resolve: aLookup copyAsSuper
]
