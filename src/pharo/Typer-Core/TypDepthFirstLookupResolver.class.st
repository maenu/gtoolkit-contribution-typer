Class {
	#name : #TypDepthFirstLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypDepthFirstLookupResolver >> canResolve: aLookup [
	^ (resolver canResolve: aLookup)
		or: [ aLookup hasSuper and: [ self canResolve: aLookup copyAsSuper ] ]
]

{ #category : #resolving }
TypDepthFirstLookupResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	(resolver canResolve: aLookup)
		ifTrue: [ ^ resolver resolve: aLookup ].
	^ self resolve: aLookup copyAsSuper
]
