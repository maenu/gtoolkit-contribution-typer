Class {
	#name : #TypDepthFirstResolver,
	#superclass : #TypWrappingResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypDepthFirstResolver >> canResolve: aLookup [
	^ (resolver canResolve: aLookup)
		or: [ aLookup hasSuper and: [ self canResolve: aLookup asSuper ] ]
]

{ #category : #resolving }
TypDepthFirstResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	(resolver canResolve: aLookup)
		ifTrue: [ ^ resolver resolve: aLookup ].
	^ self resolve: aLookup asSuper
]
